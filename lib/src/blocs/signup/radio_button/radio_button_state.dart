part of 'radio_button_bloc.dart';

class RadioButtonState extends Equatable {
  @override
  List<Object> get props => [];
}

class RadioButtonInit extends RadioButtonState {}

class RadioButtonChanged extends RadioButtonState {
  final int value;
  RadioButtonChanged({@required this.value});
  List<Object> get props => [value];
}
