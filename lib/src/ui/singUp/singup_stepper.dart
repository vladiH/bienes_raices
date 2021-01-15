import 'package:bienes_servicios/src/blocs/signup/singup_bloc.dart';
import 'package:bienes_servicios/src/blocs/signup/stepper/stepper_bloc.dart';
import 'package:bienes_servicios/src/ui/singUp/birthdate.dart';
import 'package:bienes_servicios/src/ui/singUp/email.dart';
import 'package:bienes_servicios/src/ui/singUp/gender.dart';
import 'package:bienes_servicios/src/ui/singUp/lastname.dart';
import 'package:bienes_servicios/src/ui/singUp/name.dart';
import 'package:bienes_servicios/src/ui/singUp/password.dart';
import 'package:bienes_servicios/src/ui/singUp/phone.dart';
import 'package:bienes_servicios/src/ui/singUp/singup_submitted_button.dart';
import 'package:bienes_servicios/src/utils/colors.dart';
import 'package:bienes_servicios/src/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SingUpStepper extends StatefulWidget {
  @override
  _SingUpStepperState createState() => _SingUpStepperState();
}

class _SingUpStepperState extends State<SingUpStepper> {
  StepperBloc stepperBloc;
  SingupBloc singupBloc;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final birthdateController = TextEditingController(
      text: DateFormat("yyyy-MM-dd").format(DateTime.now()));
  final lastNameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  @override
  void initState() {
    singupBloc = context.bloc<SingupBloc>();
    stepperBloc = StepperBloc(maxSteps: 7);
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
    nameController.addListener(_onNameChanged);
    lastNameController.addListener(_onLastNameChanged);
    phoneController.addListener(_onPhoneChanged);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    singupBloc.add(EmailValidate(email: emailController.text));
  }

  void _onPasswordChanged() {
    singupBloc.add(PasswordValidate(password: passwordController.text));
  }

  void _onNameChanged() {
    singupBloc.add(NameValidate(name: nameController.text));
  }

  void _onLastNameChanged() {
    singupBloc.add(LastNameValidate(lastName: lastNameController.text));
  }

  void _onPhoneChanged() {
    singupBloc.add(PhoneValidate(phone: phoneController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingupBloc, SingupState>(
      builder: (context, state) {
        return BlocProvider.value(
          value: stepperBloc,
          child: BlocBuilder<StepperBloc, StepperState>(
            builder: (contextStepper, stateStepper) {
              return Column(
                children: <Widget>[
                  Stepper(
                    controlsBuilder: (BuildContext context,
                        {VoidCallback onStepContinue,
                        VoidCallback onStepCancel}) {
                      return Material(
                        color: cardColor,
                        elevation: 20,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: stateStepper.step !=
                                  stateStepper.maxSteps - 1
                              ? <Widget>[
                                  FlatButton(
                                      onPressed: onStepCancel,
                                      child: Text(
                                        "Atras",
                                        style: iconText,
                                      )),
                                  RaisedButton(
                                    color: Theme.of(context).buttonColor,
                                    onPressed: onStepContinue,
                                    child: Text("Siguiente", style: buttonText),
                                  ),
                                ]
                              : <Widget>[
                                  FlatButton(
                                    onPressed: onStepCancel,
                                    child: Text(
                                      "Atras",
                                      style: iconText,
                                    ),
                                  ),
                                ],
                        ),
                      );
                    },
                    steps: [
                      Step(
                          title: Text(
                            "Correo",
                            style: subTitle,
                          ),
                          content: Email(
                            emailController: emailController,
                          ),
                          isActive: true,
                          state: state.isEmailValid
                              ? StepState.indexed
                              : StepState.error),
                      Step(
                          title: Text(
                            "Contraseña",
                            style: subTitle,
                          ),
                          content: Password(
                            passwordController: passwordController,
                          ),
                          subtitle: state.isPasswordValid
                              ? null
                              : Text(
                                  "Debe contener caracteres y digitos. [a-zA-Z][0-9]"),
                          isActive: true,
                          state: state.isPasswordValid
                              ? StepState.indexed
                              : StepState.error),
                      Step(
                          title: Text(
                            "Nombres",
                            style: subTitle,
                          ),
                          content: Name(
                            nameController: nameController,
                          ),
                          isActive: true,
                          state: state.isNameValid
                              ? StepState.indexed
                              : StepState.error),
                      Step(
                          title: Text(
                            "Apellidos",
                            style: subTitle,
                          ),
                          content: LastName(
                            lastNameController: lastNameController,
                          ),
                          isActive: true,
                          state: state.isLastNameValid
                              ? StepState.indexed
                              : StepState.error),
                      Step(
                          title: Text(
                            "Celular",
                            style: subTitle,
                          ),
                          subtitle: Text(
                            "ej. +51943526222",
                            style: subText,
                          ),
                          content: Phone(
                            phoneController: phoneController,
                          ),
                          isActive: true,
                          state: state.isPhoneValid
                              ? StepState.indexed
                              : StepState.error),
                      Step(
                        title: Text(
                          "Nacimiento",
                          style: subTitle,
                        ),
                        subtitle: Text(
                          "yyyy/mm/dd",
                          style: subText,
                        ),
                        content: BirthDate(
                          birthdateController: birthdateController,
                        ),
                        isActive: true,
                      ),
                      Step(
                        title: Text(
                          "Genero",
                          style: subTitle,
                        ),
                        content: Gender(
                          genderController: genderController,
                        ),
                        isActive: true,
                      ),
                    ],
                    currentStep: stateStepper.step,
                    type: StepperType.vertical,
                    onStepTapped: (step) {
                      if (!FocusScope.of(context).hasPrimaryFocus) {
                        FocusScope.of(context).unfocus();
                      }
                      stepperBloc.add(StepTapped(step: step));
                    },
                    onStepCancel: () {
                      if (!FocusScope.of(context).hasPrimaryFocus) {
                        FocusScope.of(context).unfocus();
                      }
                      stepperBloc.add(StepCancelled());
                    },
                    onStepContinue: () {
                      if (!FocusScope.of(context).hasPrimaryFocus) {
                        FocusScope.of(context).unfocus();
                      }
                      stepperBloc.add(StepContinue());
                    },
                  ),
                  SingUpSubmittedButton(
                    emailController: emailController,
                    passwordController: passwordController,
                    nameController: nameController,
                    lastNameController: lastNameController,
                    birthdateController: birthdateController,
                    phoneController: phoneController,
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
