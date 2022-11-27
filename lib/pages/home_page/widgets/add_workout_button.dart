import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/blocs.dart';

/// Button to add new workouts
class AddWorkoutButton extends StatelessWidget {
  /// Add workout
  const AddWorkoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        BlocProvider.of<WorkoutsCubit>(context)
            .createWorkout(DateTime.now().toString());
      },
      child: const Icon(Icons.add),
    );
  }
}
