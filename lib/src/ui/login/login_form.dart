import 'package:bienes_servicios/src/blocs/login/login_bloc.dart';
import 'package:bienes_servicios/src/ui/commons/common_button.dart';
import 'package:bienes_servicios/src/ui/commons/common_textform_field.dart';
import 'package:bienes_servicios/src/ui/commons/password_text_form_field.dart';
import 'package:bienes_servicios/src/ui/utils/navigation.dart';
import 'package:bienes_servicios/src/utils/colors.dart';
import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  LoginBloc _loginBloc;
  bool visible = true;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginInWithEmailButtonPressed(
        email: _emailController.text, password: _passwordController.text));
  }

  void _emailOrPasswordEmpty() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
    _loginBloc.add(PasswordChanged(password: _passwordController.text));
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _emailTextField(LoginState state) {
      return CommonTextFormField(
        hintText: "correo",
        textEditingController: _emailController,
        prefixIcon: Icons.email,
        textInputType: TextInputType.emailAddress,
        onChanged: (String val) {
          return !state.isEmailValid ? 'Correo no valido' : null;
        },
      );
    }

    Widget _passwordTextField(LoginState state) {
      return PasswordTextFormField(
          hintText: "contraseña",
          textEditingController: _passwordController,
          onPressed: (String val) {
            return !state.isPasswordValid ? 'Contraseña invalida' : null;
          },
          prefixIcon: Icons.lock,
          sufixIcon: Icons.remove_red_eye);
    }

    Widget _forgotPasswordText() {
      return Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: () => null,
          child: Text(
            "¿Olvide mi contraseña?",
            style: spamText,
          ),
        ),
      );
    }

    Widget _buttonLogin(LoginState state) {
      return CommonButton(
        onPressed: isLoginButtonEnabled(state)
            ? _onFormSubmitted
            : _emailOrPasswordEmpty,
        buttonColors: button1Color,
        text: "Ingresar",
      );
    }

    Widget _buttonSignUp() {
      return CommonButton(
        onPressed: () => navigateToSingUp(context),
        buttonColors: button2Color,
        text: "Registrarse",
      );
    }

    Widget _sizeBox() {
      return const SizedBox(
        height: 32,
      );
    }

    Widget _divider() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            Text(
              'or',
              style: spamText,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    }

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, 0.3),
                        blurRadius: 20.0,
                        offset: Offset(0, 10))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _emailTextField(state),
                  _sizeBox(),
                  _passwordTextField(state),
                  _sizeBox(),
                  _buttonLogin(state),
                  _sizeBox(),
                  _forgotPasswordText(),
                  _divider(),
                  _sizeBox(),
                  _buttonSignUp()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
