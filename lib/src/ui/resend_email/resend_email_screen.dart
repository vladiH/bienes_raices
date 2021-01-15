import 'package:bienes_servicios/src/blocs/resend_email/resend_email_bloc.dart';
import 'package:bienes_servicios/src/repositories/singup/singup_repository.dart';
import 'package:bienes_servicios/src/ui/resend_email/resend_email_form.dart';
import 'package:bienes_servicios/src/ui/resend_email/resend_email_title.dart';
import 'package:bienes_servicios/src/ui/utils/navigation.dart';
import 'package:bienes_servicios/src/ui/commons/custom_back_button.dart';
import 'package:bienes_servicios/src/ui/widgets/state_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendEmailScreen extends StatelessWidget {
  static const String routeName = 'ResendEmailScreen';
  const ResendEmailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RepositoryProvider(
          create: (context) => SingupRepository(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => ResendEmailBloc(
                      singupRepository:
                          RepositoryProvider.of<SingupRepository>(context)))
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<ResendEmailBloc, ResendEmailState>(
                    listenWhen: (previous, current) {
                  if (previous != current) {
                    return true;
                  }
                  return false;
                }, listener: (context, state) {
                  if (state is LoadingResendEmail) {
                    return showLoading(context);
                  }
                  if (state is FailureResendEmail) {
                    Navigator.of(context, rootNavigator: true).pop();
                    showError(context, state.error);
                  }
                  if (state is SuccessResendEmail) {
                    Navigator.of(context, rootNavigator: true).pop();
                    navigateToPinCode(context,
                        BlocProvider.of<ResendEmailBloc>(context).email);
                  }
                }),
              ],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CustomBackButton(),
                    ResendEmailTitle(),
                    ResendEmailForm()
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
