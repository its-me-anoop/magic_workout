import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/blocs.dart';
import 'package:magic_workout/models/models.dart';
import 'package:magic_workout/pages/home_page/widgets/exercise_widget.dart';

/// Workouts List Widget
class WorkoutsListWidget extends StatelessWidget {
  /// Workouts List widget which requires [workouts]
  const WorkoutsListWidget({super.key, required this.workouts});

  /// List of workouts
  final List<Workout> workouts;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
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
                  icon: const Icon(Icons.edit),
                ),
                title: Text(
                  workout.title!,
                  style: Theme.of(context).textTheme.headline6,
                ),
                trailing: Text('${workout.exercises.length.toString()} sets'),
              ),
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: workout.exercises.length,
                itemBuilder: (context, index) => ExerciseWidget(
                  index: index,
                  workout: workout,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
