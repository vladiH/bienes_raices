import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final List<Color> buttonColors;
  final String text;
  CommonButton({@required this.onPressed, this.text, this.buttonColors});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      onPressed: this.onPressed,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: this.buttonColors,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8, // soften the shadow
                spreadRadius: 2, //end the shadow
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            borderRadius: BorderRadius.circular(4.0)),
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
        child: Text(this.text, textAlign: TextAlign.center, style: buttonText),
      ),
    );
  }
}
