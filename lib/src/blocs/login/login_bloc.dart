import 'package:bienes_servicios/src/blocs/authentication/authentication_bloc.dart';
import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/models/users.dart';
import 'package:bienes_servicios/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:bienes_servicios/src/repositories/login/login_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final AuthenticationBloc authenticationBloc;
  String error;
  LoginBloc({@required this.loginRepository, @required this.authenticationBloc})
      : assert(loginRepository != null),
        assert(authenticationBloc != null),
        super(LoginState.empty());

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
    Stream<LoginEvent> events,
    TransitionFunction<LoginEvent, LoginState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged || event is! PasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 9000));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    }
    if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    }
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    }
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginInWithEmailButtonPressedToState(event);
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      //await _userRepository.signInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginInWithEmailButtonPressedToState(
      LoginInWithEmailButtonPressed event) async* {
    yield LoginState.loading();
    try {
      User user;
      final Response response = await loginRepository
          .signInWithEmailAndPassword(event.email, event.password);
      if (response.data != null) {
        final json = Map<String, dynamic>.from(response.data);
        user = User.fromJson(json);
      }
      if (response.getSuccess) {
        authenticationBloc.add(UserLoggedIn(user: user));
        await loginRepository.queryLisAds();
        yield LoginState.success();
      } else {
        error = response.errors[0].getMessage;
        yield LoginState.failure();
      }
    } catch (err) {
      error = err.message ?? 'An unknown error occured';
      yield LoginState.failure();
    }
    /*final QueryResult result = await loginRepository.queryLisAds();
    print(result.data);
    add(isLoading(loading: false));*/
  }
}
