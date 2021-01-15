import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/repositories/singup/singup_repository.dart';
import 'package:bienes_servicios/src/utils/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'resend_email_event.dart';
part 'resend_email_state.dart';

class ResendEmailBloc extends Bloc<ResendEmailEvent, ResendEmailState> {
  bool _isEmailValid = true;
  String _email = "";
  final SingupRepository singupRepository;
  ResendEmailBloc({@required this.singupRepository})
      : super(InitialResendEmail());
  bool get isFormValid => _isEmailValid;
  String get email => _email;
  @override
  Stream<ResendEmailState> mapEventToState(ResendEmailEvent event) async* {
    if (event is SendEmailEvent) {
      yield* _mapResendEmailToState(event);
    }
    if (event is EmailValidate) {
      yield* _mapEmailValidateToState(event);
    }
  }

  Stream<ResendEmailState> _mapResendEmailToState(SendEmailEvent event) async* {
    yield LoadingResendEmail();
    try {
      final Response response =
          await singupRepository.changeEmailToken(event.email);
      if (response.getSuccess) {
        this._email = event.email;
        yield SuccessResendEmail(email: event.email);
      } else {
        yield FailureResendEmail(error: response.errors[0].message);
      }
    } catch (err) {
      yield FailureResendEmail(
          error: err.message ?? 'An unknown error occured');
    }
  }

  Stream<ResendEmailState> _mapEmailValidateToState(
      EmailValidate event) async* {
    _isEmailValid = Validators.isValidEmail(event.email);
    yield IsEmailValid(isEmailValid: _isEmailValid);
  }
}
