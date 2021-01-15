import 'package:bienes_servicios/src/ui/commons/common_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthDate extends StatefulWidget {
  final birthdateController;
  BirthDate({@required this.birthdateController});
  @override
  _BirthDateState createState() => _BirthDateState();
}

class _BirthDateState extends State<BirthDate> {
  DateTime _fromDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Future<void> _showDatePicker() async {
      final picked = await showDatePicker(
          context: context,
          locale: const Locale(
            "es",
          ),
          initialDate: _fromDate,
          firstDate: DateTime(1950, 8),
          lastDate: DateTime(2100));
      if (picked != null && picked != _fromDate) {
        setState(() {
          _fromDate = picked;
          widget.birthdateController.text =
              DateFormat("yyyy-MM-dd").format(_fromDate);
        });
      }
    }

    return Material(
      elevation: 20,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: CommonTextFormField(
        hintText: DateFormat("yyyy-MM-dd").format(_fromDate),
        textEditingController: widget.birthdateController,
        prefixIcon: Icons.phone_android,
        textInputType: TextInputType.datetime,
        onTap: () => _showDatePicker(),
      ),
    );
  }
}
