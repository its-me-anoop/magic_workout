import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/cubit/workout_cubit.dart';
import 'package:magic_workout/blocs/cubit/workouts_cubit.dart';
import 'package:magic_workout/blocs/states/workout_state.dart';
import 'package:magic_workout/models/models.dart';
import 'package:magic_workout/pages/edit_exercise.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          WorkoutEditing we = state as WorkoutEditing;
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () =>
                    BlocProvider.of<WorkoutCubit>(context).goHome(),
              ),
              title: Text(we.workout!.title!),
              actions: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    BlocProvider.of<WorkoutsCubit>(context)
                        .deleteWorkout(state.workout);
                    BlocProvider.of<WorkoutCubit>(context).goHome();
                  },
                )
              ],
            ),
            body: ListView.builder(
              itemCount: state.workout!.exercises.length,
              itemBuilder: (BuildContext context, int index) {
                Exercise exercise = we.workout!.exercises[index];
                if (we.exIndex == index) {
                  return EditExercise(we.workout, we.index, we.exIndex);
                } else {
                  return ListTile(
                    leading: Text('${exercise.weight.toString()} Kg'),
                    title: Text(exercise.title!),
                    trailing: Text('${exercise.repetitions.toString()} times'),
                    onTap: () => BlocProvider.of<WorkoutCubit>(context)
                        .editExercise(index),
                  );
                }
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<WorkoutCubit>(context)
                    .addExercise(we.workout!.exercises);

                BlocProvider.of<WorkoutCubit>(context)
                    .editExercise(we.workout!.exercises.length - 1);
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      );
}
