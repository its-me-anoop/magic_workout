// ignore_for_file: always_declare_return_types, inference_failure_on_function_return_type, lines_longer_than_80_chars, type_annotate_public_apis, unused_local_variable

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:magic_workout/models/models.dart';

/// Workouts Cubit
class WorkoutsCubit extends HydratedCubit<List<Workout>> {
  /// Initial State
  WorkoutsCubit() : super([]);

  /// Get all workouts
  getWorkouts() async {
    final workouts = <Workout>[];
    // final workoutsJson =
    //     jsonDecode(await rootBundle.loadString('assets/workouts.json'));
    // for (var el in workoutsJson as Iterable) {
    //   workouts.add(Workout.fromJson(el as Map<String, dynamic>));
    // }
    emit(workouts);
  }

  /// Save Workout
  saveWorkout(Workout workout, int index) {
    // ignore: prefer_const_literals_to_create_immutables
    final newWorkout =
        Workout(title: workout.title, exercises: workout.exercises);

    state[index] = newWorkout;

    emit([...state]);
  }

  /// Create Workout
  createWorkout(String title) => emit([
        Workout(
            title: title,
            exercises: [Exercise(title: 'Barbell', weight: 0, repetitions: 1)]),
        ...state
      ]);

  /// Import Workout from Json
  importWorkout(String json) => emit(
        [Workout.fromJson(jsonDecode(json) as Map<String, dynamic>), ...state],
      );

  /// Delete Workout
  deleteWorkout(Workout? workout) =>
      emit(state.where((el) => el != workout).toList());

  /// Required for Hydrated Bloc to read data from local storage
  @override
  List<Workout> fromJson(Map<String, dynamic> json) {
    var workouts = <Workout>[];
    json['workouts'].forEach(
      (el) => workouts.add(Workout.fromJson(el as Map<String, dynamic>)),
    );
    return workouts;
  }

  /// Required for Hydrated Bloc to write data from local storage
  @override
  Map<String, dynamic>? toJson(List<Workout> state) {
    if (state is List<Workout>) {
      var json = {'workouts': []};
      for (var workout in state) {
        json['workouts']!.add(workout.toJson());
      }
      return json;
    } else {
      return null;
    }
  }
}
