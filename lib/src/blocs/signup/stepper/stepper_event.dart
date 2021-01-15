part of 'stepper_bloc.dart';

abstract class StepperEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StepTapped extends StepperEvent {
  final int step;

  StepTapped({@required this.step});
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'StepTapped { step: $step }';
}

class StepCancelled extends StepperEvent {
  @override
  String toString() => 'StepCancelled';
}

class StepContinue extends StepperEvent {
  @override
  String toString() => 'StepContinue';
}
