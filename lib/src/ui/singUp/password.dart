import 'package:bienes_servicios/src/ui/commons/password_text_form_field.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  final passwordController;
  Password({@required this.passwordController});
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: PasswordTextFormField(
          hintText: "contraseña",
          textEditingController: widget.passwordController,
          prefixIcon: Icons.lock,
          sufixIcon: Icons.remove_red_eye),
    );
  }
}
