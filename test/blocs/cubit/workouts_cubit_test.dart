import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_workout/blocs/cubit/cubit.dart';
import 'package:magic_workout/blocs/cubit/workouts_cubit.dart';
import 'package:magic_workout/models/models.dart';

import '../../helpers/hydrated_bloc.dart';

void main() {
  initHydratedStorage();

  group('Workouts cubit ...', () {
    test('initial state is []', () {
      expect(WorkoutsCubit().state, []);
    });

    blocTest<WorkoutsCubit, List<Workout>>('gets a list of workouts ...',
        build: WorkoutsCubit.new,
        seed: () => <Workout>[Workout(title: 'test', exercises: const [])],
        act: (cubit) => cubit..getWorkouts(),
        expect: () => [[]]);

    blocTest<WorkoutsCubit, List<Workout>>('create workout ...',
        build: WorkoutsCubit.new,
        seed: () => <Workout>[],
        act: (cubit) => cubit.createWorkout('new workout'),
        expect: () => [
              [
                Workout(title: 'new workout', exercises: const [
                  Exercise(title: 'Barbell', weight: 0, repetitions: 1)
                ]),
              ]
            ]);
  });
}
