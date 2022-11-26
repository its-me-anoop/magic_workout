// ignore_for_file: unused_local_variable

import 'package:equatable/equatable.dart';
import 'package:magic_workout/models/exercise.dart';

/// [Workout] model
class Workout extends Equatable {
  /// [Workout] consists of [title] and [exercises]
  const Workout({required this.title, required this.exercises});

  /// Json to Object
  factory Workout.fromJson(Map<String, dynamic> json) {
    final exercises = <Exercise>[];
    var index = 0;

    for (final ex in json['exercises'] as Iterable) {
      exercises.add(Exercise.fromJson(ex as Map<String, dynamic>, index));
      index++;
    }
    return Workout(title: json['title'] as String?, exercises: exercises);
  }

  /// Object to Json
  Map<String, dynamic> toJson() => {'title': title, 'exercises': exercises};

  /// [title] of a [Workout]
  final String? title;

  /// [exercises] or sets in each [Workout]
  final List<Exercise> exercises;

  @override
  List<Object?> get props => [title, exercises];

  @override
  bool get stringify => true;
}
