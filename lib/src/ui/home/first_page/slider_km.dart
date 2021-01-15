import 'package:bienes_servicios/src/blocs/home/first_page/slider/slider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderKm extends StatefulWidget {
  @override
  _SliderKmState createState() => _SliderKmState();
}

class _SliderKmState extends State<SliderKm> {
  double sliderVal = 0;
  SliderBloc sliderBloc;
  @override
  void initState() {
    super.initState();
    sliderBloc = BlocProvider.of<SliderBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderBloc, double>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height / 2,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: RotatedBox(
                quarterTurns: 3,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Slider(
                        inactiveColor: Colors.white70,
                        activeColor: Colors.amber,
                        divisions: sliderBloc.divisions,
                        value: state,
                        min: sliderBloc.min,
                        max: sliderBloc.max,
                        label: '$state km',
                        onChanged: (double value) {
                          sliderBloc.add(ChangeSliderValue(value: value));
                        },
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
