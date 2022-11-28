import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/blocs.dart';
import 'package:magic_workout/models/models.dart';
import 'package:magic_workout/pages/edit_page/edit_exercise.dart';
import 'package:magic_workout/pages/pages.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<WorkoutCubit, WorkoutState>(builder: (context, state) {
        WorkoutEditing we = state as WorkoutEditing;
        return Scaffold(
            appBar: AppBar(
                leading: BackButton(
                    onPressed: () =>
                        BlocProvider.of<WorkoutCubit>(context).goHome()),
                title: Text(we.workout!.title!),
                actions: [
                  IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        BlocProvider.of<WorkoutsCubit>(context)
                            .deleteWorkout(state.workout);
                        BlocProvider.of<WorkoutCubit>(context).goHome();
                      })
                ]),
            body: ListView.builder(
                itemCount: state.workout!.exercises.length,
                itemBuilder: (BuildContext context, int index) {
                  Exercise exercise = we.workout!.exercises[index];
                  if (we.exIndex == index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child:
                              EditExercise(we.workout, we.index, we.exIndex)),
                    );
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                                leading:
                                    Text('${exercise.weight.toString()} kg'),
                                title: Text(exercise.title!),
                                trailing: Text(
                                    '${exercise.repetitions.toString()} times'),
                                onTap: () =>
                                    BlocProvider.of<WorkoutCubit>(context)
                                        .editExercise(index)),
                          ),
                        ),
                      ],
                    );
                  }
                }),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  state.workout!.exercises.add(const Exercise(
                    title: 'Barbell',
                    weight: 0,
                    repetitions: 1,
                  ));
                  BlocProvider.of<WorkoutCubit>(context)
                      .editExercise(we.workout!.exercises.length - 1);
                },
                child: const Icon(Icons.add)));
      });
}
