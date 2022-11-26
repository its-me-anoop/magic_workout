// ignore_for_file: always_declare_return_types, inference_failure_on_function_return_type, lines_longer_than_80_chars, type_annotate_public_apis

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/models/models.dart';

/// Workouts Cubit
class WorkoutsCubit extends Cubit<List<Workout>> {
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
}
