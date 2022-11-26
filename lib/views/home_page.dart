import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/cubits/workouts_cubit.dart';
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
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.add)),
          IconButton(onPressed: null, icon: Icon(Icons.settings))
        ],
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
                      leading: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.edit),
                      ),
                      title: Text(workout.title!),
                    ),
                    body: ListView.builder(
                      shrinkWrap: true,
                      itemCount: workout.exercises.length,
                      itemBuilder: (context, index) => ListTile(
                        visualDensity: const VisualDensity(
                          vertical: VisualDensity.maximumDensity,
                        ),
                        leading: const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.edit),
                        ),
                        title: Text(
                          workout.exercises[index].title!,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
