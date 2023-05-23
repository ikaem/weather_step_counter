// weather_step_counter/lib/features/weather/presentation/blocs/weather/weather_bloc_state.dart

import 'package:equatable/equatable.dart';
import 'package:weather_step_counter/features/weather/domain/models/weather/weather_model.dart';

abstract class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

class WeatherBlocStateInitial extends WeatherBlocState {}

class WeatherBlocStateLoading extends WeatherBlocState {}

class WeatherBlocStateSuccess extends WeatherBlocState {
  final WeatherModel weatherModel;

  const WeatherBlocStateSuccess(this.weatherModel);

  @override
  List<Object> get props => [weatherModel];
}

class WeatherBlocStateFailure extends WeatherBlocState {
  final String errorMessage;

  const WeatherBlocStateFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
