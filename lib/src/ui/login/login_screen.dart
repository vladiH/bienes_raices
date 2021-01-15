import 'package:bienes_servicios/src/blocs/authentication/authentication_bloc.dart';
import 'package:bienes_servicios/src/blocs/login/login_bloc.dart';
import 'package:bienes_servicios/src/repositories/login/login_repository.dart';
import 'package:bienes_servicios/src/ui/utils/navigation.dart';
import 'package:bienes_servicios/src/ui/widgets/state_dialog.dart';
import 'package:bienes_servicios/src/ui/login/login_background.dart';
import 'package:bienes_servicios/src/ui/login/login_form.dart';
import 'package:bienes_servicios/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  static LoginRepository _loginRepository;
  @override
  Widget build(BuildContext context) {
    _loginRepository = RepositoryProvider.of<LoginRepository>(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
            loginRepository: _loginRepository,
            authenticationBloc: context.bloc<AuthenticationBloc>()),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isFailure) {
              showError(context, BlocProvider.of<LoginBloc>(context).error);
              Navigator.of(context, rootNavigator: true).pop();
            }
            if (state.isSubmitting) {
              showLoading(context);
            }
            if (state.isSuccess) {
              Navigator.of(context, rootNavigator: true).pop();
              navigateToHome(context);
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: backgroundColor,
              ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: LogInBackground(),
                ),
                Expanded(
                    flex: 2, child: SingleChildScrollView(child: LoginForm()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
