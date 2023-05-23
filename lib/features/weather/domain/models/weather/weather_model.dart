// Path: weather_step_counter/lib/features/weather/domain/models/weather/weather_model.dart
// weather_step_counter/lib/features/weather/domain/models/weather/weather_model.dart

class WeatherModel {
  const WeatherModel({
    required this.locationName,
    required this.locationTempC,
  });

  final String locationName;
  final double locationTempC;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> location = json['location'];
    final Map<String, dynamic> current = json['current'];

    return WeatherModel(
      locationName: location["name"] as String,
      locationTempC: current["temp_c"] as double,
    );
  }
}
