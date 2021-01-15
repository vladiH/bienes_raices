import 'package:bienes_servicios/src/ui/home/home_screen.dart';
import 'package:bienes_servicios/src/ui/login/login_screen.dart';
import 'package:bienes_servicios/src/ui/pin_code/pin_code_screen.dart';
import 'package:bienes_servicios/src/ui/resend_email/resend_email_screen.dart';
import 'package:bienes_servicios/src/ui/singUp/singup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

navigateToLogin(BuildContext context) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
navigateToHome(BuildContext context) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
navigateToSingUp(BuildContext context) =>
    Navigator.of(context).pushNamed(SingUpScreen.routeName);
navigateToResendEmail(BuildContext context) =>
    Navigator.of(context).pushNamed(ResendEmailScreen.routeName);
navigateToPinCode(BuildContext context, String email) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => PinCodeScreen(email: email)));
