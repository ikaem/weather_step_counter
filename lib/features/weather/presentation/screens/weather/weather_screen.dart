// weather_step_counter/lib/features/weather/presentation/screens/weather/weather_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_step_counter/features/weather/domain/models/weather/weather_model.dart';
import 'package:weather_step_counter/features/weather/presentation/blocs/weather/weather_bloc.dart';
import 'package:weather_step_counter/features/weather/presentation/blocs/weather/weather_bloc_event.dart';
import 'package:weather_step_counter/features/weather/presentation/blocs/weather/weather_bloc_state.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: Builder(builder: (builderContext) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Weather Forecast'),
          ),
          body: Center(
            child: BlocBuilder<WeatherBloc, WeatherBlocState>(
              builder: (context, state) {
                if (state is WeatherBlocStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WeatherBlocStateSuccess) {
                  final WeatherModel weatherModel = state.weatherModel;
                  return Column(
                    children: [
                      Text('Location: ${weatherModel.locationName}'),
                      Text('Temperature: ${weatherModel.locationTempC}°C'),
                    ],
                  );
                } else if (state is WeatherBlocStateFailure) {
                  return Text(
                      'Failed to fetch weather data: ${state.errorMessage}');
                } else {
                  return const Text('No weather data available');
                }
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<WeatherBloc>(builderContext)
                  .add(const WeatherBlocEventFetch());
            },
            child: const Icon(Icons.refresh),
          ),
        );
      }),
    );
  }
}
