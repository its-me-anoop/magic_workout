import 'package:equatable/equatable.dart';
import 'package:magic_workout/models/models.dart';

abstract class WorkoutState extends Equatable {
  final Workout? workout;

  const WorkoutState(
    this.workout,
  );
}

class WorkoutInitial extends WorkoutState {
  const WorkoutInitial() : super(null);

  @override
  List<Object> get props => [];
}

class WorkoutInProgress extends WorkoutState {
  const WorkoutInProgress(Workout? workout, int? elapsed) : super(workout);

  @override
  List<Object?> get props => [workout];
}

class WorkoutPaused extends WorkoutState {
  const WorkoutPaused(Workout? workout, int? elapsed) : super(workout);

  @override
  List<Object?> get props => [workout];
}

class WorkoutEditing extends WorkoutState {
  final int index;
  final int? exIndex;
  final List<Exercise>? exercises;
  const WorkoutEditing(
      Workout? workout, this.index, this.exIndex, this.exercises)
      : super(workout);

  @override
  List<Object?> get props => [workout, index, exIndex, exercises];
}
