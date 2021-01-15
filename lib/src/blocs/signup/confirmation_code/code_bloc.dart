import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/repositories/singup/singup_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'code_event.dart';
part 'code_state.dart';

class CodeBloc extends Bloc<CodeEvent, CodeState> {
  final SingupRepository singupRepository;
  CodeBloc({@required this.singupRepository}) : super(Initial());
  @override
  Stream<CodeState> mapEventToState(CodeEvent event) async* {
    if (event is SubmitCode) {
      yield* _mapSubmitCodeToState(event);
    }
  }

  Stream<CodeState> _mapSubmitCodeToState(SubmitCode event) async* {
    yield Loading();
    try {
      final Response response =
          await singupRepository.confirmationCode(event.email, event.code);
      if (response.getSuccess) {
        yield Success();
      }
      if (!response.getSuccess) {
        yield Failure(error: response.getErrors[0].message);
      }
    } catch (err) {
      yield Failure(error: err.message ?? 'An unknown error occured');
    }
  }
}
