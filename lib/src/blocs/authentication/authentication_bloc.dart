import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/models/users.dart';
import 'package:bienes_servicios/src/repositories/login/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository loginRepository;

  AuthenticationBloc({@required this.loginRepository})
      : assert(loginRepository != null),
        super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState(event);
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppLoadedToState(AppLoaded event) async* {
    yield AuthenticationLoading(); // to display splash screen
    try {
      //await Future.delayed(Duration(milliseconds: 500)); // a simulated delay
      User user;
      final Response response = await loginRepository.getCurrentUser();
      if (response.data != null) {
        final json = Map<String, dynamic>.from(response.data);
        user = User.fromJson(json);
      }

      if (response.getSuccess) {
        yield AuthenticationAuthenticated(user: user);
      }
      if (response.getSuccess == false) {
        yield AuthenticationNotAuthenticated();
      }
    } catch (e) {
      yield AuthenticationFailure(
          message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoggedInToState(
      UserLoggedIn event) async* {
    yield AuthenticationAuthenticated(user: event.user);
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState(
      UserLoggedOut event) async* {
    await loginRepository.signOut();
    yield AuthenticationNotAuthenticated();
  }
}
