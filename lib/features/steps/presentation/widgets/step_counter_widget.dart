// weather_step_counter/lib/features/core/presentation/widgets/step_counter_widget.dart
import 'package:flutter/material.dart';

class StepCounterWidget extends StatefulWidget {
  const StepCounterWidget({super.key});

  @override
  State<StepCounterWidget> createState() => _StepCounterWidgetState();
}

class _StepCounterWidgetState extends State<StepCounterWidget> {
  int stepCount = 0;

  void incrementStepCount() {
    setState(() {
      stepCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Step Count: $stepCount'),
        ElevatedButton(
          onPressed: incrementStepCount,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
