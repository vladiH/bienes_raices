import 'dart:math';

import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/repositories/singup/singup_repository.dart';
import 'package:bienes_servicios/src/utils/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'singup_event.dart';
part 'singup_state.dart';

class SingupBloc extends Bloc<SingupEvent, SingupState> {
  final SingupRepository singupRepository;
  String error;
  String email;
  SingupBloc({@required this.singupRepository}) : super(SingupState.initial());

  @override
  Stream<SingupState> mapEventToState(SingupEvent event) async* {
    if (event is Submitted) {
      yield* _mapSubmittedToState(event);
    }
    if (event is EmailValidate) {
      yield* _mapEmailValidateToState(event);
    }
    if (event is PasswordValidate) {
      yield* _mapPasswordValidateToState(event);
    }
    if (event is NameValidate) {
      yield* _mapNameValidateToState(event);
    }
    if (event is LastNameValidate) {
      yield* _mapLastNameValidateToState(event);
    }
    if (event is PhoneValidate) {
      yield* _mapPhoneValidateToState(event);
    }
  }

  Stream<SingupState> _mapSubmittedToState(Submitted event) async* {
    yield state.loading();
    try {
      final Response response = await singupRepository.singUp(
          event.email,
          event.password,
          event.name,
          event.lastName,
          event.phone,
          event.birthdate,
          event.gender);
      if (response.getSuccess) {
        this.email = event.email;
        yield state.success();
      } else {
        this.error = response.errors[0].getMessage;
        yield state.failure();
      }
    } catch (err) {
      this.error = err.message ?? 'An unknown error occured';
      yield state.failure();
    }
  }

  Stream<SingupState> _mapEmailValidateToState(EmailValidate event) async* {
    yield state.copyWith(isEmailValid: Validators.isValidEmail(event.email));
  }

  Stream<SingupState> _mapPasswordValidateToState(
      PasswordValidate event) async* {
    yield state.copyWith(
        isPasswordValid: Validators.isValidPassword(event.password));
  }

  Stream<SingupState> _mapNameValidateToState(NameValidate event) async* {
    yield state.copyWith(isNameValid: Validators.isValidNames(event.name));
  }

  Stream<SingupState> _mapLastNameValidateToState(
      LastNameValidate event) async* {
    yield state.copyWith(
        isLastNameValid: Validators.isValidNames(event.lastName));
  }

  Stream<SingupState> _mapPhoneValidateToState(PhoneValidate event) async* {
    yield state.copyWith(isPhoneValid: Validators.isValidPhone(event.phone));
  }
}
