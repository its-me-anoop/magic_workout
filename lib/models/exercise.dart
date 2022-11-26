import 'package:equatable/equatable.dart';

/// [Exercise] model
class Exercise extends Equatable {
  /// [Exercise] consists of [title], [weight], [repetitions] and [index]
  const Exercise({
    required this.title,
    required this.weight,
    required this.repetitions,
    this.index,
  });

  /// Json to Object
  factory Exercise.fromJson(Map<String, dynamic> json, int index) => Exercise(
        title: json['title'] as String?,
        weight: json['weight'] as int?,
        repetitions: json['repetitions'] as int?,
        index: index,
      );

  /// Object to Json
  Map<String, dynamic> toJson() => {
        'title': title,
        'weight': weight,
        'repetitions': repetitions,
      };

  /// [title] or workout type
  final String? title;

  /// [weight] used during exercise
  final int? weight;

  /// [repetitions] of each exercise
  final int? repetitions;

  /// [index] is used to identify exercises
  final int? index;

  @override
  List<Object?> get props => [title, weight, repetitions, index];

  @override
  bool get stringify => true;
}
