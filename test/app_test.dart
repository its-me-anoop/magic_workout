import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_workout/app.dart';
import 'package:magic_workout/blocs/cubit/cubit.dart';
import 'helpers/hydrated_bloc.dart';

void main() {
  initHydratedStorage();
  testWidgets('app ...', (tester) async {
    await tester.pumpWidget(const MagicWorkout());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
