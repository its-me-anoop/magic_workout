// ignore_for_file: always_declare_return_types, inference_failure_on_function_return_type, lines_longer_than_80_chars, type_annotate_public_apis

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
    final workoutsJson =
        jsonDecode(await rootBundle.loadString('assets/workouts.json'));
    for (final el in workoutsJson as Iterable) {
      workouts.add(Workout.fromJson(el as Map<String, dynamic>));
    }
    emit(workouts);
  }

  saveWorkout(Workout workout, int index) {
    // ignore: prefer_const_literals_to_create_immutables
    final newWorkout = Workout(title: workout.title, exercises: []);
    var exIndex = 0;

    for (final ex in workout.exercises) {
      newWorkout.exercises.add(
        Exercise(title: ex.title, index: exIndex, weight: 0, repetitions: 1),
      );
      exIndex++;
    }
    /*
    because we have a list of states we we could do index
     */
    state[index] = newWorkout;

    emit([...state]);
  }

  createWorkout(String title) =>
      emit([Workout(title: title, exercises: const []), ...state]);

  importWorkout(String json) => emit(
        [Workout.fromJson(jsonDecode(json) as Map<String, dynamic>), ...state],
      );

  deleteWorkout(Workout? workout) =>
      emit(state.where((el) => el != workout).toList());

  @override
  List<Workout> fromJson(Map<String, dynamic> json) {
    var workouts = <Workout>[];
    json['workouts'].forEach(
      (el) => workouts.add(Workout.fromJson(el as Map<String, dynamic>)),
    );
    return workouts;
  }

  @override
  Map<String, dynamic>? toJson(List<Workout> state) {
    if (state is List<Workout>) {
      var json = {'workouts': []};
      for (final workout in state) {
        print("..in toJson..");
        json['workouts']!.add(workout.toJson());
      }
      return json;
    } else {
      return null;
    }
  }
}
