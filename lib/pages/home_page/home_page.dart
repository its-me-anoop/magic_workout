import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/cubit/workouts_cubit.dart';
import 'package:magic_workout/models/workout.dart';
import 'package:magic_workout/pages/home_page/widgets/add_workout_button.dart';
import 'package:magic_workout/pages/home_page/widgets/workouts_list_widget.dart';

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
          builder: (context, workouts) => WorkoutsListWidget(
            workouts: workouts,
          ),
        ),
      ),
      floatingActionButton: const AddWorkoutButton(),
    );
  }
}
