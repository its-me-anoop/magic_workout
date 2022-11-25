import 'package:magic_workout/models/exercise.dart';

/// [Workout] model
class Workout {
  /// [Workout] consists of [title] and [exercises]
  const Workout({required this.title, required this.exercises});

  /// Json to Object
  factory Workout.fromJson(Map<String, dynamic> json) {
    final exercises = <Exercise>[];
    var index = 0;

    for (final ex in json['exercises'] as Iterable) {
      exercises.add(Exercise.fromJson(json, index));
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
}