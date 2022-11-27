import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/blocs/blocs.dart';
import 'package:magic_workout/models/models.dart';
import 'package:numberpicker/numberpicker.dart';

/// Edit Exercise
class EditExercise extends StatefulWidget {
  const EditExercise(this._workout, this._index, this._exIndex, {Key? key})
      : super(key: key);

  final Workout? _workout;
  final int _index;
  final int? _exIndex;

  @override
  _EditExerciseState createState() =>
      _EditExerciseState(workout: _workout, index: _index, exIndex: _exIndex);
}

class _EditExerciseState extends State<EditExercise> {
  _EditExerciseState(
      {required this.workout, required this.index, required this.exIndex});

  TextEditingController? _title;
  final Workout? workout;
  final int index;
  final int? exIndex;

  @override
  void initState() {
    _title = TextEditingController(
        text: widget._workout!.exercises[widget._exIndex!].title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        Row(children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: NumberPicker(
                    itemHeight: 30,
                    value: widget._workout!.exercises[widget._exIndex!].weight!,
                    minValue: 0,
                    maxValue: 3599,
                    onChanged: (value) => setState(() {
                          widget._workout!.exercises[widget._exIndex!] = widget
                              ._workout!.exercises[widget._exIndex!]
                              .copyWith(weight: value);

                          BlocProvider.of<WorkoutsCubit>(context)
                              .saveWorkout(widget._workout!, widget._index);
                        })),
              ),
              const Expanded(child: Text('Kg'))
            ],
          )),
          Expanded(
              flex: 2,
              child: TextField(
                  textAlign: TextAlign.center,
                  controller: _title,
                  onChanged: (value) => setState(() {
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
              child: Row(
            children: [
              Expanded(
                child: NumberPicker(
                    itemHeight: 30,
                    value: widget
                        ._workout!.exercises[widget._exIndex!].repetitions!,
                    minValue: 1,
                    maxValue: 3599,
                    onChanged: (value) => setState(() {
                          widget._workout!.exercises[widget._exIndex!] = widget
                              ._workout!.exercises[widget._exIndex!]
                              .copyWith(repetitions: value);
                          BlocProvider.of<WorkoutsCubit>(context)
                              .saveWorkout(widget._workout!, widget._index);
                        })),
              ),
              const Expanded(child: Text('times'))
            ],
          ))
        ]),
      ]);
}
