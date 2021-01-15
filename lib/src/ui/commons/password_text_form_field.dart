import 'package:bienes_servicios/src/utils/colors.dart';
import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordTextFormField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData sufixIcon;
  final TextEditingController textEditingController;
  final Function(String) onPressed;
  PasswordTextFormField(
      {@required this.textEditingController,
      @required this.hintText,
      this.prefixIcon,
      this.sufixIcon,
      this.onPressed});
  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: borderTextFormField))),
      child: TextFormField(
          style: textFieldText,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: hintTextColor),
            filled: true,
            errorStyle: textFieldErrorText,
            prefixIcon: Icon(
              widget.prefixIcon,
              color: Theme.of(context).iconTheme.color,
            ),
            suffixIcon: IconButton(
                color: this.visible ? iconColor : primaryColor,
                icon: Icon(widget.sufixIcon),
                onPressed: () {
                  setState(() {
                    this.visible = !visible;
                  });
                }),
          ),
          obscureText: visible,
          autovalidateMode: AutovalidateMode.always,
          controller: widget.textEditingController,
          validator: widget.onPressed),
    );
  }
}
