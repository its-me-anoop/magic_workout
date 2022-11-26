import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:magic_workout/blocs/cubit/workout_cubit.dart';
import 'package:magic_workout/blocs/cubit/workouts_cubit.dart';
import 'package:magic_workout/blocs/states/workout_state.dart';
import 'package:magic_workout/models/workout.dart';
import 'package:magic_workout/pages/edit_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:magic_workout/pages/home_page.dart';
import 'package:magic_workout/pages/workout_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MagicWorkout());
}

/// Magic Workout App
class MagicWorkout extends StatelessWidget {
  /// Magic Workout
  const MagicWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Workout',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Color.fromARGB(255, 66, 74, 96)),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WorkoutsCubit>(
            create: (context) {
              final workoutsCubit = WorkoutsCubit();
              if (workoutsCubit.state.isEmpty) {
                workoutsCubit.getWorkouts();
              }
              return workoutsCubit;
            },
          ),
          BlocProvider<WorkoutCubit>(
            create: (context) => WorkoutCubit(),
          ),
        ],
        child: BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (context, state) {
            if (state is WorkoutInitial) {
              return const HomePage();
            } else if (state is WorkoutEditing) {
              return const EditPage();
            } else {
              return const WorkoutPage();
            }
          },
        ),
      ),
    );
  }
}
