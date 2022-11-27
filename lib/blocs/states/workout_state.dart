import 'package:equatable/equatable.dart';
import 'package:magic_workout/models/models.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState(this.workout, this.elapsed);
  final Workout? workout;
  final int? elapsed;
}

class WorkoutInitial extends WorkoutState {
  const WorkoutInitial() : super(null, 0);

  @override
  List<Object> get props => [];
}

class WorkoutEditing extends WorkoutState {
  const WorkoutEditing(Workout? workout, this.index, this.exIndex)
      : super(workout, 0);
  final int index;
  final int? exIndex;

  @override
  List<Object?> get props => [workout, index, exIndex];
}
