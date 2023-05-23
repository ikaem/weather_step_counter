// weather_step_counter/lib/features/weather/presentation/blocs/weather/weather_bloc.dart

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_step_counter/features/weather/domain/models/weather/weather_model.dart';
import 'package:weather_step_counter/features/weather/presentation/blocs/weather/weather_bloc_event.dart';
import 'package:weather_step_counter/features/weather/presentation/blocs/weather/weather_bloc_state.dart';

const String weatherApiUrl = 'https://api.weatherapi.com/v1/current.json';
const String weatherApiKey = 'DONT_KEEP_YOUR_API_KEYS_IN_SOURCE_CODE';
const String weatherApiCity = 'Zagreb';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherBlocStateInitial()) {
    _registerEventHandlers();
  }

  void _registerEventHandlers() {
    on<WeatherBlocEventFetch>(
      _onWeatherFetchEvent,
    );
  }

  Future<void> _onWeatherFetchEvent(
    WeatherBlocEventFetch event,
    Emitter<WeatherBlocState> emit,
  ) async {
    emit(WeatherBlocStateLoading());

    try {
      final Response<dynamic> response = await Dio().get(
        'https://api.weatherapi.com/v1/current.json',
        queryParameters: {
          'key': weatherApiKey,
          'q': weatherApiCity,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch weather data');
      }

      final dynamic weatherData = response.data;
      final WeatherModel weatherModel = WeatherModel.fromJson(weatherData);

      emit(WeatherBlocStateSuccess(weatherModel));
    } catch (e) {
      emit(const WeatherBlocStateFailure('Failed to fetch weather data'));
    }
  }
}
