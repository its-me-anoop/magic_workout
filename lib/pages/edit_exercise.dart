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
          Expanded(
              child: InkWell(
                  onLongPress: () => showDialog(
                      context: context,
                      builder: (_) {
                        final controller = TextEditingController(
                            text: widget
                                ._workout!.exercises[widget._exIndex!].weight
                                .toString());
                        return AlertDialog(
                            content: TextField(
                                controller: controller,
                                decoration:
                                    const InputDecoration(labelText: "prelude"),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    if (controller.text.isNotEmpty) {
                                      Navigator.pop(context);
                                      setState(() {
                                        widget._workout!
                                                .exercises[widget._exIndex!] =
                                            widget._workout!
                                                .exercises[widget._exIndex!]
                                                .copyWith(
                                                    weight: int.parse(
                                                        controller.text));
                                        BlocProvider.of<WorkoutsCubit>(context)
                                            .saveWorkout(widget._workout!,
                                                widget._index);
                                      });
                                    }
                                  },
                                  child: Text("save"))
                            ]);
                      }),
                  child: NumberPicker(
                      itemHeight: 30,
                      value:
                          widget._workout!.exercises[widget._exIndex!].weight!,
                      minValue: 0,
                      maxValue: 3599,
                      onChanged: (value) => setState(() {
                            widget._workout!.exercises[widget._exIndex!] =
                                widget._workout!.exercises[widget._exIndex!]
                                    .copyWith(weight: value);
                            BlocProvider.of<WorkoutsCubit>(context)
                                .saveWorkout(widget._workout!, widget._index);
                          })))),
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
              child: InkWell(
                  onLongPress: () => showDialog(
                      context: context,
                      builder: (_) {
                        final controller = TextEditingController(
                            text: widget._workout!.exercises[widget._exIndex!]
                                .repetitions
                                .toString());
                        return AlertDialog(
                            content: TextField(
                                controller: controller,
                                decoration: const InputDecoration(
                                  labelText: 'Repetitions',
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ]),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    if (controller.text.isNotEmpty) {
                                      Navigator.pop(context);
                                      setState(() {
                                        widget._workout!
                                                .exercises[widget._exIndex!] =
                                            widget._workout!
                                                .exercises[widget._exIndex!]
                                                .copyWith(
                                                    repetitions: int.parse(
                                                        controller.text));
                                        BlocProvider.of<WorkoutsCubit>(context)
                                            .saveWorkout(widget._workout!,
                                                widget._index);
                                      });
                                    }
                                  },
                                  child: Text('Save'))
                            ]);
                      }),
                  child: NumberPicker(
                      itemHeight: 30,
                      value: widget
                          ._workout!.exercises[widget._exIndex!].repetitions!,
                      minValue: 1,
                      maxValue: 3599,
                      onChanged: (value) => setState(() {
                            widget._workout!.exercises[widget._exIndex!] =
                                widget._workout!.exercises[widget._exIndex!]
                                    .copyWith(repetitions: value);
                            BlocProvider.of<WorkoutsCubit>(context)
                                .saveWorkout(widget._workout!, widget._index);
                          }))))
        ]),
        /* ButtonBar(alignment: MainAxisAlignment.spaceEvenly, children: [
          (widget._exIndex! > 0)
              ? IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () {
                    widget._workout!.exercises.insert(widget._exIndex! - 1,
                        widget._workout!.exercises.removeAt(widget._exIndex!));
                    BlocProvider.of<WorkoutCubit>(context)
                        .editExercise(widget._exIndex! - 1);
                    BlocProvider.of<WorkoutsCubit>(context)
                        .saveWorkout(widget._workout!, widget._index);
                  })
              : null,
          (widget._exIndex! < widget._workout!.exercises.length - 1)
              ? IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () {
                    widget._workout!.exercises.insert(widget._exIndex! + 1,
                        widget._workout!.exercises.removeAt(widget._exIndex!));
                    BlocProvider.of<WorkoutCubit>(context)
                        .editExercise(widget._exIndex! + 1);
                    BlocProvider.of<WorkoutsCubit>(context)
                        .saveWorkout(widget._workout!, widget._index);
                  })
              : null,
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                print("hihihi");
                widget._workout!.exercises.removeAt(widget._exIndex!);
                BlocProvider.of<WorkoutCubit>(context).editExercise(null);
                BlocProvider.of<WorkoutsCubit>(context)
                    .saveWorkout(widget._workout!, widget._index);
              })
        ])*/
      ]);
}
