import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'slider_event.dart';

class SliderBloc extends Bloc<SliderEvent, double> {
  double value;
  final double max;
  final double min;
  final int divisions;
  SliderBloc(
      {@required this.max,
      @required this.min,
      @required this.divisions,
      @required this.value})
      : super(value);

  @override
  Stream<double> mapEventToState(SliderEvent event) async* {
    if (event is ChangeSliderValue) {
      yield* _mapChangeSliderValueToState(event);
    }
  }

  Stream<double> _mapChangeSliderValueToState(ChangeSliderValue event) async* {
    this.value = event.value.roundToDouble();
    yield this.value;
  }
}
