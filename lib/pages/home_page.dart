import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/cubit/workout_cubit.dart';
import 'package:magic_workout/blocs/cubit/workouts_cubit.dart';
import 'package:magic_workout/models/workout.dart';

/// Home Page
class HomePage extends StatelessWidget {
  /// Home Page
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic Workout'),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
          builder: (context, workouts) => ExpansionPanelList.radio(
            children: workouts
                .map(
                  (workout) => ExpansionPanelRadio(
                    value: workout,
                    headerBuilder: (context, isExpanded) => ListTile(
                      visualDensity: const VisualDensity(
                        vertical: VisualDensity.maximumDensity,
                      ),
                      leading: IconButton(
                        onPressed: () => BlocProvider.of<WorkoutCubit>(context)
                            .editWorkout(workout, workouts.indexOf(workout)),
                        icon: Icon(Icons.edit),
                      ),
                      title: Text(
                        workout.title!,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      trailing:
                          Text('${workout.exercises.length.toString()} sets'),
                    ),
                    body: ListView.builder(
                      shrinkWrap: true,
                      itemCount: workout.exercises.length,
                      itemBuilder: (context, index) => ListTile(
                        visualDensity: const VisualDensity(
                          vertical: VisualDensity.maximumDensity,
                        ),
                        leading: Text(
                          '${workout.exercises[index].weight!.toString()} Kg',
                        ),
                        title: Text(
                          workout.exercises[index].title!,
                        ),
                        trailing: Text(
                          '${workout.exercises[index].repetitions!.toString()} times',
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<WorkoutsCubit>(context)
              .createWorkout(DateTime.now().toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
