import 'package:bienes_servicios/src/blocs/signup/confirmation_code/code_bloc.dart';
import 'package:flutter/material.dart';

showError(BuildContext context, String error) {
  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(error),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Theme.of(context).errorColor,
      duration: Duration(seconds: 1),
    ));
}

showSucces(BuildContext context, String success) {
  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(success),
      backgroundColor: Theme.of(context).accentColor,
      duration: Duration(seconds: 1),
    ));
}

showLoading(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (_) => Material(
      type: MaterialType.transparency,
      child: Center(
        // Aligns the container to center
        child: CircularProgressIndicator(),
      ),
    ),
  );
}

void displayInputDialogToConfirmationCode(
    BuildContext context, CodeBloc codeBloc, String email) async {
  TextEditingController codeController = TextEditingController();
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: RichText(
              text: TextSpan(
                  text: 'Ingrese el codigo enviado a: ',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                TextSpan(
                  text: email,
                  style: TextStyle(
                      color: Color(0xffe46b10),
                      fontSize: 16,
                      fontFamily: 'Raleway'),
                ),
              ])),
          content: TextField(
            controller: codeController,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: 'Codigo',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
            ),
          ),
          actions: <Widget>[
            new FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            new RaisedButton(
              color: Colors.blueAccent,
              child: new Text('Enviar'),
              onPressed: () {
                codeBloc
                    .add(SubmitCode(email: email, code: codeController.text));
              },
            ),
          ],
        );
      });
}
