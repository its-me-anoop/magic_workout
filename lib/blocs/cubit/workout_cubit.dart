// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:magic_workout/blocs/blocs.dart';

import 'package:magic_workout/models/models.dart';

/// Workout Cubit
class WorkoutCubit extends Cubit<WorkoutState> {
  /// Workout Cubit initial state
  WorkoutCubit() : super(const WorkoutInitial());

  /// Edit Workout
  void editWorkout(
    Workout workout,
    int index,
  ) {
    return emit(WorkoutEditing(workout, index, null, null));
  }

  /// Edit Exercise
  void editExercise(int? exIndex) {
    return emit(
      WorkoutEditing(
        state.workout,
        (state as WorkoutEditing).index,
        exIndex,
        null,
      ),
    );
  }

  /// Add Exercise
  void addExercise(List<Exercise> exercises) {
    exercises.add(Exercise(title: 'Barbell', weight: 0, repetitions: 1));
    return emit(
      WorkoutEditing(
        state.workout,
        (state as WorkoutEditing).index,
        null,
        exercises,
      ),
    );
  }

  /// Go to Home Page
  void goHome() {
    return emit(const WorkoutInitial());
  }
}
