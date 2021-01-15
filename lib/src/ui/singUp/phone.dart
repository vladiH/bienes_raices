import 'package:bienes_servicios/src/ui/commons/common_textform_field.dart';
import 'package:flutter/material.dart';

class Phone extends StatefulWidget {
  final phoneController;
  Phone({@required this.phoneController});
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: CommonTextFormField(
          hintText: "Celular",
          textEditingController: widget.phoneController,
          prefixIcon: Icons.phone_android,
          textInputType: TextInputType.phone),
    );
  }
}
