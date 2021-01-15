import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';

class PinCodeTitle extends StatelessWidget {
  final String email;
  PinCodeTitle({@required this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: RichText(
          text: TextSpan(
              text: 'Ingrese el codigo enviado a: ',
              style: title,
              children: [
            TextSpan(
              text: email,
              style: subTitle,
            ),
          ])),
    );
  }
}
