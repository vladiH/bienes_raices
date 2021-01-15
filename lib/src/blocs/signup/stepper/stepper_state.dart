part of 'stepper_bloc.dart';

class StepperState extends Equatable {
  final int step;
  final int maxSteps;
  final int stepVisited;

  StepperState(
      {@required this.step,
      @required this.maxSteps,
      @required this.stepVisited});

  StepperState copyWith({int step, int maxSteps, int stepVisited}) {
    return StepperState(
        step: step ?? this.step,
        maxSteps: maxSteps ?? this.maxSteps,
        stepVisited: stepVisited ?? this.stepVisited);
  }

  @override
  String toString() =>
      'StepperState { step: $step, maxSteps: $maxSteps, stepVisited: $stepVisited }';

  @override
  List<Object> get props => [step, maxSteps, stepVisited];
}
