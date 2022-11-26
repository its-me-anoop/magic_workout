import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:magic_workout/blocs/states/workout_state.dart';
import 'package:magic_workout/models/models.dart';

class WorkoutCubit extends HydratedCubit<WorkoutState> {
  WorkoutCubit() : super(const WorkoutInitial());

  void editWorkout(Workout workout, int index) {
    return emit(WorkoutEditing(workout, index, null));
  }

  void editExercise(int? exIndex) {
    return emit(
      WorkoutEditing(
        state.workout,
        (state as WorkoutEditing).index,
        exIndex,
      ),
    );
  }

  void goHome() {
    return emit(const WorkoutInitial());
  }

  @override
  WorkoutState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(WorkoutState state) {
    return null;
  }
}
