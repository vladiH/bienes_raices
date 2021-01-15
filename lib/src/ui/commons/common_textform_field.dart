import 'package:bienes_servicios/src/utils/colors.dart';
import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonTextFormField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final VoidCallback onTap;
  CommonTextFormField(
      {@required this.textEditingController,
      @required this.hintText,
      this.prefixIcon,
      this.textInputType,
      this.onChanged,
      this.onTap});
  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: borderTextFormField))),
      child: TextFormField(
          showCursor: widget.onTap != null ? false : true,
          readOnly: widget.onTap != null ? true : false,
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
              color: iconColor,
            ),
          ),
          onTap: widget.onTap != null ? widget.onTap : null,
          keyboardType: widget.textInputType,
          autocorrect: false,
          autovalidateMode: AutovalidateMode.always,
          controller: widget.textEditingController,
          validator: widget.onChanged),
    );
  }
}
