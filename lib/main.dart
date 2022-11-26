import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/cubits/workouts_cubit.dart';
import 'package:magic_workout/models/workout.dart';

import 'package:magic_workout/views/home_page.dart';

void main() => runApp(const MagicWorkout());

/// Magic Workout App
class MagicWorkout extends StatelessWidget {
  /// Magic Workout
  const MagicWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Workout',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Color.fromARGB(255, 66, 74, 96)),
        ),
      ),
      home: BlocProvider<WorkoutsCubit>(
        create: (context) {
          final workoutsCubit = WorkoutsCubit();
          if (workoutsCubit.state.isEmpty) {
            workoutsCubit.getWorkouts();
          }
          return workoutsCubit;
        },
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
          builder: (context, state) {
            return const HomePage();
          },
        ),
      ),
    );
  }
}
