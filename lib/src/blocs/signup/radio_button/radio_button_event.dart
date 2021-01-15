part of 'radio_button_bloc.dart';

class RadioButtonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RadioButtonOnChanged extends RadioButtonEvent {
  final int value;
  RadioButtonOnChanged({@required this.value});

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'RadioButtonOnChanged { value: $value }';
}
