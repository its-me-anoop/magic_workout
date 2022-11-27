# magic_workout

Create, Edit and Delete your workouts

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## Sample Workout Data

```json
[
    {
        "title": "Workout 1",
        "exercises": [
            {
                "title": "Bench Press",
                "weight": 40,
                "repetitions": 10
            },
            {
                "title": "Bench Press",
                "weight": 45,
                "repetitions": 8
            },
            {
                "title": "Bench Press",
                "weight": 50,
                "repetitions": 8
            },
            {
                "title": "Deadlift",
                "weight": 70,
                "repetitions": 8
            },
            {
                "title": "Deadlift",
                "weight": 75,
                "repetitions": 6
            }
        ]
    },
    {
        "title": "Workout 2",
        "exercises": [
            {
                "title": "Bench Press",
                "weight": 30,
                "repetitions": 8
            },
            {
                "title": "Bench Press",
                "weight": 45,
                "repetitions": 8
            }
        ]
    }
]
```

---

## Models

### Exercise Model

```json
{
    "title": "Bench Press",
    "weight": 45,
    "repetitions": 8
}
```

```dart
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

  ///
  Exercise copyWith({
    String? title,
    int? weight,
    int? repetitions,
    int? index,
  }) =>
      Exercise(
        title: title ?? this.title,
        weight: weight ?? this.weight,
        repetitions: repetitions ?? this.repetitions,
        index: index ?? this.index,
      );

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
```

### Workout Model

```json
{
    "title": "Workout 2",
    "exercises": [
        {
            "title": "Bench Press",
            "weight": 30,
            "repetitions": 8
        },
        {
            "title": "Bench Press",
            "weight": 45,
            "repetitions": 8
        }
    ]
}
```

```dart
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
```

## Project Structure

```sh
|-- lib
    |-- blocs
    |   |-- cubit
    |   |-- states
    |-- models
    |-- pages
    |-- app.dart
    |-- bloc_observer.dart
    |-- main.dart
```

## Clean Architecture

Clean Architecture focuses on dividing software into layers, to simplify the development and maintenance of the system itself. When layers are well-separated, individual pieces can be reused, as well as developed and updated independently.

### 1. Feature Layer

Feature Layer is the presentation layer of the application, it is the most framework-dependent layer, as it contains the UI and the event handlers of the UI.

### 2. Domain Layer

Domain Layer is the innermost part of the layers (no dependencies with other layers) and it contains Entities, Use Cases & Repository Interfaces.

### 3. Data Layer

Represents the data layer of the application. The Data module, which is a part of the outermost layer, is responsible for data retrieval. This can be in the form of API calls to a server and/or a local database. It also contains repository implementations.

---

## Third party packages

1. ```equatable:```

    Equatable helps to compare values in a class / model

2. ```flutter_bloc:```

    Bloc state management

3. ```hydrated_bloc:```

    Local Storage. HydratedStorage is built on top of hive for a platform-agnostic, performant storage layer

4. ```path_provider:```

    To obtain path to local device storage

5. ```bloc_test:```

    Bloc and Cubit testing

6. ```mocktail:```

    To use Mocks in testing

7. ```very_good_analysis:```

    This package provides lint rules for Dart and Flutter
