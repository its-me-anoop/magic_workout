import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/blocs.dart';

import 'package:magic_workout/pages/pages.dart';

/// Magic Workout App
class MagicWorkout extends StatelessWidget {
  /// Magic Workout
  const MagicWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Workout',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WorkoutsCubit>(
            create: (context) {
              final workoutsCubit = WorkoutsCubit();
              if (workoutsCubit.state.isEmpty) {
                workoutsCubit.getWorkouts();
              }
              return workoutsCubit;
            },
          ),
          BlocProvider<WorkoutCubit>(
            create: (context) => WorkoutCubit(),
          ),
        ],
        child: BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (context, state) {
            if (state is WorkoutInitial) {
              return const HomePage();
            } else if (state is WorkoutEditing) {
              return const EditPage();
            } else {
              return const WorkoutPage();
            }
          },
        ),
      ),
    );
  }
}
