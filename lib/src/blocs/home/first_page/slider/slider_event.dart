part of 'slider_bloc.dart';

class SliderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeSliderValue extends SliderEvent {
  final double value;
  ChangeSliderValue({@required this.value});

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'ChangeSliderValue { value: $value }';
}
