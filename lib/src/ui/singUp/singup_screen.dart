import 'package:bienes_servicios/src/blocs/signup/confirmation_code/code_bloc.dart';
import 'package:bienes_servicios/src/blocs/signup/radio_button/radio_button_bloc.dart';
import 'package:bienes_servicios/src/blocs/signup/singup_bloc.dart';
import 'package:bienes_servicios/src/repositories/singup/singup_repository.dart';
import 'package:bienes_servicios/src/ui/utils/navigation.dart';
import 'package:bienes_servicios/src/ui/widgets/state_dialog.dart';
import 'package:bienes_servicios/src/ui/singUp/resend_email.dart';
import 'package:bienes_servicios/src/ui/commons/custom_back_button.dart';
import 'package:bienes_servicios/src/ui/singUp/singup_stepper.dart';
import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUpScreen extends StatelessWidget {
  static const String routeName = 'SingUpScreen';
  const SingUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => SingupRepository(),
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => CodeBloc(
                      singupRepository:
                          RepositoryProvider.of<SingupRepository>(context))),
              BlocProvider(create: (context) => RadioButtonBloc()),
              BlocProvider<SingupBloc>(
                create: (context) => SingupBloc(
                    singupRepository:
                        RepositoryProvider.of<SingupRepository>(context)),
              ),
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<SingupBloc, SingupState>(
                    listener: (context, state) {
                  if (state.isSubmitting) {
                    showLoading(context);
                  }
                  if (state.isFailure) {
                    Navigator.of(context, rootNavigator: true).pop();
                    showError(context, context.bloc<SingupBloc>().error);
                  }
                  if (state.isSuccess) {
                    Navigator.of(context, rootNavigator: true).pop();
                    navigateToPinCode(
                        context, context.bloc<SingupBloc>().email);
                  }
                }),
                BlocListener<CodeBloc, CodeState>(listener: (context, state) {
                  if (state is Loading) {
                    showLoading(context);
                  }
                  if (state is Failure) {
                    Navigator.of(context, rootNavigator: true).pop();
                    showError(context, state.error);
                  }
                  if (state is Success) {
                    Navigator.of(context, rootNavigator: true).pop();
                    navigateToLogin(context);
                  }
                })
              ],
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CustomBackButton(),
                        Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Mis datos",
                              style: title,
                            ),
                          ),
                        ),
                        SingUpStepper(),
                        ResendEmail()
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
