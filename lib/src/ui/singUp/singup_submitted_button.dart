import 'package:bienes_servicios/src/blocs/signup/radio_button/radio_button_bloc.dart';
import 'package:bienes_servicios/src/blocs/signup/singup_bloc.dart';
import 'package:bienes_servicios/src/ui/commons/common_button.dart';
import 'package:bienes_servicios/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUpSubmittedButton extends StatelessWidget {
  final emailController;
  final passwordController;
  final birthdateController;
  final lastNameController;
  final nameController;
  final phoneController;
  SingUpSubmittedButton(
      {@required this.emailController,
      @required this.passwordController,
      @required this.nameController,
      @required this.lastNameController,
      @required this.birthdateController,
      @required this.phoneController});
  @override
  Widget build(BuildContext context) {
    final SingupBloc singupBloc = BlocProvider.of<SingupBloc>(context);
    final RadioButtonBloc radioButtonBloc =
        BlocProvider.of<RadioButtonBloc>(context);
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: CommonButton(
        onPressed: singupBloc.state.isFormValid
            ? () {
                singupBloc.add(Submitted(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    lastName: lastNameController.text,
                    phone: phoneController.text,
                    birthdate: birthdateController.text,
                    gender: radioButtonBloc.getValue));
              }
            : null,
        buttonColors: button1Color,
        text: "Registrarse",
      ),
    );
  }
}
