// ignore_for_file: unused_local_variable

import 'package:equatable/equatable.dart';
import 'package:magic_workout/models/exercise.dart';

/// [Workout] model
class Workout extends Equatable {
  /// [Workout] consists of [title] and [exercises]
  Workout({required this.title, required this.exercises});

  /// Json to Object
  factory Workout.fromJson(Map<String, dynamic> json) {
    List<Exercise> exercises = [];
    var index = 0;

    for (var ex in json['exercises'] as Iterable) {
      exercises.add(Exercise.fromJson(ex as Map<String, dynamic>));
      index++;
    }
    return Workout(title: json['title'] as String?, exercises: exercises);
  }

  /// Object to Json
  Map<String, dynamic> toJson() => {'title': title, 'exercises': exercises};

  /// [title] of a [Workout]
  String? title;

  /// [exercises] or sets in each [Workout]
  List<Exercise> exercises;

  @override
  List<Object?> get props => [title, exercises];

  @override
  bool get stringify => true;
}
