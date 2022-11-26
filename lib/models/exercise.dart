import 'package:equatable/equatable.dart';

/// [Exercise] model
class Exercise extends Equatable {
  /// [Exercise] consists of [title], [weight], [repetitions]
  const Exercise({
    required this.title,
    required this.weight,
    required this.repetitions,
  });

  /// Json to Object
  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        title: json['title'] as String?,
        weight: json['weight'] as int?,
        repetitions: json['repetitions'] as int?,
      );

  /// Object to Json
  Map<String, dynamic> toJson() => {
        'title': title,
        'weight': weight,
        'repetitions': repetitions,
      };

  /// Copy With to replace existing Exercise
  Exercise copyWith({
    String? title,
    int? weight,
    int? repetitions,
  }) =>
      Exercise(
        title: title ?? this.title,
        weight: weight ?? this.weight,
        repetitions: repetitions ?? this.repetitions,
      );

  /// [title] or workout type
  final String? title;

  /// [weight] used during exercise
  final int? weight;

  /// [repetitions] of each exercise
  final int? repetitions;

  @override
  List<Object?> get props => [title, weight, repetitions];

  @override
  bool get stringify => true;
}
