import 'package:bienes_servicios/src/blocs/signup/confirmation_code/code_bloc.dart';
import 'package:bienes_servicios/src/repositories/singup/singup_repository.dart';
import 'package:bienes_servicios/src/ui/pin_code/pin_code.dart';
import 'package:bienes_servicios/src/ui/pin_code/pin_code_title.dart';
import 'package:bienes_servicios/src/ui/utils/navigation.dart';
import 'package:bienes_servicios/src/ui/commons/custom_back_button.dart';
import 'package:bienes_servicios/src/ui/widgets/state_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinCodeScreen extends StatelessWidget {
  static const String routeName = 'PinCodeScreen';
  final String email;
  const PinCodeScreen({this.email, key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RepositoryProvider(
          create: (context) => SingupRepository(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => CodeBloc(
                      singupRepository:
                          RepositoryProvider.of<SingupRepository>(context))),
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<CodeBloc, CodeState>(listener: (context, state) {
                  if (state is Loading) {
                    showLoading(context);
                  }
                  if (state is Failure) {
                    showError(context, state.error);
                    Navigator.of(context, rootNavigator: true).pop();
                  }
                  if (state is Success) {
                    Navigator.of(context, rootNavigator: true).pop();
                    navigateToLogin(context);
                  }
                })
              ],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CustomBackButton(),
                    PinCodeTitle(
                      email: this.email,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    PinCode(
                      email: this.email,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
