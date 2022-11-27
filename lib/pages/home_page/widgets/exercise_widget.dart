import 'package:flutter/material.dart';
import 'package:magic_workout/models/models.dart';

/// Exercise Widget displaying a single exercise
class ExerciseWidget extends StatelessWidget {
  /// Ecercise Widget requires [index] and [workout]
  const ExerciseWidget({
    super.key,
    required this.index,
    required this.workout,
  });

  /// Index of exercise
  final int index;

  /// Parent workout
  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(
        vertical: VisualDensity.maximumDensity,
      ),
      leading: Text(
        '${workout.exercises[index].weight!.toString()} Kg',
      ),
      title: Text(
        workout.exercises[index].title!,
      ),
      // ignore: lines_longer_than_80_chars
      trailing: Text(
        '${workout.exercises[index].repetitions!.toString()} times',
      ),
    );
  }
}
