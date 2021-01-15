import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'stepper_event.dart';
part 'stepper_state.dart';

class StepperBloc extends Bloc<StepperEvent, StepperState> {
  final int maxSteps;

  StepperBloc({@required this.maxSteps})
      : super(StepperState(step: 0, maxSteps: maxSteps, stepVisited: 0));

  @override
  Stream<StepperState> mapEventToState(StepperEvent event) async* {
    if (event is StepTapped) {
      yield* _mapStepTappedToState(event);
    } else if (event is StepCancelled) {
      yield* _mapStepCancelledToState();
    } else if (event is StepContinue) {
      yield* _mapStepContinueToState();
    }
  }

  Stream<StepperState> _mapStepTappedToState(StepTapped event) async* {
    if (state.stepVisited >= event.step) {
      yield state.copyWith(step: event.step);
    }
  }

  Stream<StepperState> _mapStepCancelledToState() async* {
    yield state.copyWith(
      step: state.step - 1 >= 0 ? state.step - 1 : 0,
    );
  }

  Stream<StepperState> _mapStepContinueToState() async* {
    int stepValue = state.step + 1 < maxSteps ? state.step + 1 : 0;
    if (state.stepVisited < stepValue) {
      yield state.copyWith(step: stepValue, stepVisited: stepValue);
    } else {
      yield state.copyWith(step: stepValue);
    }
  }
}
