// weather_step_counter/lib/features/core/presentation/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:weather_step_counter/features/steps/presentation/widgets/step_counter_widget.dart';
import 'package:weather_step_counter/features/weather/presentation/screens/weather/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decode Step Counter & Weather Forecast'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Welcome to Decode Step Counter & Weather Forecast!',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const StepCounterWidget(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WeatherScreen(),
              ),
            );
          },
          child: const Text('View Weather'),
        ),
      ]),
    );
  }
}
