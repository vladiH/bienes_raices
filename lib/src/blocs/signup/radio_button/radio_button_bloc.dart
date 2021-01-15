import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'radio_button_event.dart';
part 'radio_button_state.dart';

class RadioButtonBloc extends Bloc<RadioButtonEvent, RadioButtonState> {
  int value = -1;
  RadioButtonBloc() : super(RadioButtonInit());

  String get getValue {
    if (value == 0) {
      return "MASCULINO";
    }
    if (value == 1) {
      return "FEMENINO";
    }
    return "OTRO";
  }

  @override
  Stream<RadioButtonState> mapEventToState(RadioButtonEvent event) async* {
    if (event is RadioButtonOnChanged) {
      this.value = event.value;
      yield RadioButtonChanged(value: value);
    }
  }
}
