import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_workout/blocs/cubit/cubit.dart';
import 'package:magic_workout/models/models.dart';
import 'package:magic_workout/pages/home_page/widgets/add_workout_button.dart';
import 'package:mocktail/mocktail.dart';

class MockWorkoutsCubit extends MockCubit<List<Workout>>
    implements WorkoutsCubit {}

void main() {
  late WorkoutsCubit workoutsCubit;

  setUp(() {
    workoutsCubit = MockWorkoutsCubit();
  });

  testWidgets('add workout button ...', (tester) async {
    BuildContext context;
    await tester.pumpWidget(const MaterialApp(home: AddWorkoutButton()));

    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
