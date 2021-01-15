import 'package:bienes_servicios/src/ui/commons/common_textform_field.dart';
import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  final emailController;
  Email({@required this.emailController});
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: CommonTextFormField(
          hintText: "correo",
          textEditingController: widget.emailController,
          prefixIcon: Icons.email,
          textInputType: TextInputType.emailAddress),
    );
  }
}
