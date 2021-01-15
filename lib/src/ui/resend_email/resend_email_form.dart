import 'package:bienes_servicios/src/blocs/resend_email/resend_email_bloc.dart';
import 'package:bienes_servicios/src/ui/commons/common_button.dart';
import 'package:bienes_servicios/src/ui/commons/common_textform_field.dart';
import 'package:bienes_servicios/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendEmailForm extends StatefulWidget {
  @override
  _ResendEmailState createState() => _ResendEmailState();
}

class _ResendEmailState extends State<ResendEmailForm> {
  TextEditingController emailController = TextEditingController();
  ResendEmailBloc resendEmailBloc;
  @override
  void initState() {
    super.initState();
    resendEmailBloc = context.bloc<ResendEmailBloc>();
    emailController.addListener(_onEmailChanged);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  void _onEmailChanged() {
    resendEmailBloc.add(EmailValidate(email: emailController.text));
  }

  @override
  Widget build(BuildContext context) {
    Widget email(ResendEmailState state) {
      return CommonTextFormField(
        hintText: "Correo",
        textEditingController: emailController,
        prefixIcon: Icons.email,
        textInputType: TextInputType.emailAddress,
        onChanged: (String val) {
          if (state is IsEmailValid) {
            return !state.isEmailValid ? 'Correo invalido' : null;
          }
          return null;
        },
      );
    }

    Widget button() {
      return CommonButton(
        onPressed: resendEmailBloc.isFormValid
            ? () {
                resendEmailBloc
                    .add(SendEmailEvent(email: emailController.text));
              }
            : null,
        buttonColors: button1Color,
        text: "Enviar",
      );
    }

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        child: BlocBuilder<ResendEmailBloc, ResendEmailState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: cardColor, width: 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        email(state),
                        SizedBox(
                          height: 15,
                        ),
                        button()
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
