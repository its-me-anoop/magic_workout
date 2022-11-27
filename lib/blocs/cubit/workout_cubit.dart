import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/states/workout_state.dart';
import 'package:magic_workout/models/models.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(const WorkoutInitial());

  //this index is workout index not, exercise index

  void editWorkout(Workout workout, int index) {
    return emit(WorkoutEditing(workout, index, null));
  }

  void editExercise(int? exIndex) {
    return emit(WorkoutEditing(
        state.workout, (state as WorkoutEditing).index, exIndex));
  }

  goHome() {
    emit(const WorkoutInitial());
  }
}
