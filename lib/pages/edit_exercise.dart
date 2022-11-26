import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/cubit/workouts_cubit.dart';
import 'package:magic_workout/models/models.dart';
import 'package:numberpicker/numberpicker.dart';

class EditExercise extends StatefulWidget {
  final Workout? _workout;
  final int _index;
  final int? _exIndex;
  const EditExercise(this._workout, this._index, this._exIndex, {Key? key})
      : super(key: key);
  @override
  _EditExerciseState createState() => _EditExerciseState();
}

class _EditExerciseState extends State<EditExercise> {
  TextEditingController? _title;

  @override
  void initState() {
    _title = TextEditingController(
        text: widget._workout!.exercises[widget._exIndex!].title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        Row(children: [
          /// Weight
          Expanded(
            child: NumberPicker(
              itemHeight: 30,
              value: widget._workout!.exercises[widget._exIndex!].weight!,
              minValue: 0,
              maxValue: 3599,
              onChanged: (value) => setState(
                () {
                  widget._workout!.exercises[widget._exIndex!] = widget
                      ._workout!.exercises[widget._exIndex!]
                      .copyWith(weight: value);
                  BlocProvider.of<WorkoutsCubit>(context)
                      .saveWorkout(widget._workout!, widget._index);
                },
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: TextField(
                  textAlign: TextAlign.center,
                  controller: _title,
                  onChanged: (value) => setState(() {
                        print("changd ${widget._exIndex}");
                        int offset = _title!.selection.baseOffset;
                        widget._workout!.exercises[widget._exIndex!] = widget
                            ._workout!.exercises[widget._exIndex!]
                            .copyWith(title: value);
                        _title!.selection =
                            TextSelection.collapsed(offset: offset);
                        BlocProvider.of<WorkoutsCubit>(context)
                            .saveWorkout(widget._workout!, widget._index);
                      }))),
          Expanded(
              child: NumberPicker(
                  itemHeight: 30,
                  value:
                      widget._workout!.exercises[widget._exIndex!].repetitions!,
                  minValue: 1,
                  maxValue: 3599,
                  onChanged: (value) => setState(() {
                        widget._workout!.exercises[widget._exIndex!] = widget
                            ._workout!.exercises[widget._exIndex!]
                            .copyWith(repetitions: value);
                        BlocProvider.of<WorkoutsCubit>(context)
                            .saveWorkout(widget._workout!, widget._index);
                      })))
        ]),
      ]);
}
