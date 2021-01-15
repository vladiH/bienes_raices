import 'package:bienes_servicios/src/ui/commons/common_textform_field.dart';
import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  final nameController;
  Name({@required this.nameController});
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: CommonTextFormField(
          hintText: "Nombre",
          textEditingController: widget.nameController,
          textInputType: TextInputType.text),
    );
  }
}
