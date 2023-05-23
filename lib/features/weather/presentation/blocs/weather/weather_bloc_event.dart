// weather_step_counter/lib/features/weather/presentation/blocs/weather/weather_bloc_event.dart

import 'package:equatable/equatable.dart';

abstract class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class WeatherBlocEventFetch extends WeatherBlocEvent {
  const WeatherBlocEventFetch();
}
