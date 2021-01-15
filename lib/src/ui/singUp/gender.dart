import 'package:bienes_servicios/src/blocs/signup/radio_button/radio_button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Gender extends StatefulWidget {
  final TextEditingController genderController;

  Gender({@required this.genderController});
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  RadioButtonBloc radioButtonBloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioButtonBloc, RadioButtonState>(
      builder: (context, state) {
        radioButtonBloc = BlocProvider.of<RadioButtonBloc>(context);
        return Material(
            elevation: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                    value: 0,
                    groupValue: state is RadioButtonChanged ? state.value : -1,
                    onChanged: (value) {
                      radioButtonBloc.add(RadioButtonOnChanged(value: value));
                    }),
                Text(
                  "Hombre",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Radio(
                    value: 1,
                    groupValue: state is RadioButtonChanged ? state.value : -1,
                    onChanged: (value) {
                      radioButtonBloc.add(RadioButtonOnChanged(value: value));
                    }),
                Text(
                  "Mujer",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ));
      },
    );
  }
}
