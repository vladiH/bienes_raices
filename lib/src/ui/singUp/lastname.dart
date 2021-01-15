import 'package:bienes_servicios/src/ui/commons/common_textform_field.dart';
import 'package:flutter/material.dart';

class LastName extends StatefulWidget {
  final lastNameController;
  LastName({@required this.lastNameController});
  @override
  _LastNameState createState() => _LastNameState();
}

class _LastNameState extends State<LastName> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: CommonTextFormField(
          hintText: "Apellidos",
          textEditingController: widget.lastNameController,
          textInputType: TextInputType.text),
    );
  }
}
