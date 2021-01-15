import 'package:bienes_servicios/src/blocs/signup/confirmation_code/code_bloc.dart';
import 'package:bienes_servicios/src/utils/colors.dart';
import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class PinCode extends StatefulWidget {
  final String email;
  PinCode({this.email, key}) : super(key: key);

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  bool _onEditing = true;
  @override
  Widget build(BuildContext context) {
    CodeBloc codeBloc = BlocProvider.of<CodeBloc>(context);
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: VerificationCode(
            textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
            keyboardType: TextInputType.number,
            // in case underline color is null it will use primaryColor: Colors.red from Theme
            underlineColor: complementaryColor,
            length: 5,
            // clearAll is NOT required, you can delete it
            // takes any widget, so you can implement your design
            clearAll: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Vaciar',
                style: spamText,
              ),
            ),
            onCompleted: (String value) {
              codeBloc.add(SubmitCode(email: widget.email, code: value));
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
    );
  }
}
