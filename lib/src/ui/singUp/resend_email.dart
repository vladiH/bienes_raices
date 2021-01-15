import 'package:bienes_servicios/src/ui/utils/navigation.dart';
import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';

class ResendEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () => navigateToResendEmail(context),
          child: Text("Reenviar mi codigo", style: spamText),
        ),
      ),
    );
  }
}
