import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';

class ResendEmailTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        children: <Widget>[
          Text(
            "Ingrese su correo electrónico.",
            style: title,
          ),
          Text(
            "*Utilizamos el correo electronico para verificar que usted es propietario de la cuenta y no este siendo usado por terceros.",
            style: subText,
          ),
        ],
      ),
    );
  }
}
