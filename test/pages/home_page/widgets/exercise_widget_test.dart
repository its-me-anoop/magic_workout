import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_workout/models/exercise.dart';
import 'package:magic_workout/models/workout.dart';
import 'package:magic_workout/pages/home_page/widgets/exercise_widget.dart';

void main() {
  testWidgets('exercise widget ...', (tester) async {});

  group('exercise widget ...', () {
    int index = 0;
    Workout workout = Workout(
        title: 'Workout 1',
        exercises: [Exercise(title: 'Barbell', weight: 0, repetitions: 5)]);

    testWidgets('has List tile', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: ExerciseWidget(
            index: index,
            workout: workout,
          ),
        ),
      ));

      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text('${workout.exercises[index].weight!.toString()} Kg'),
          findsOneWidget);
      expect(find.text(workout.exercises[index].title!), findsOneWidget);
      expect(
          find.text(
              '${workout.exercises[index].repetitions!.toString()} times'),
          findsOneWidget);
    });
  });
}
