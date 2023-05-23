// weather_step_counter/lib/app.dart
import 'package:flutter/material.dart';
import 'package:weather_step_counter/features/core/presentation/screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Decode Step Counter & Weather Forecast',
      home: HomeScreen(),
    );
  }
}
