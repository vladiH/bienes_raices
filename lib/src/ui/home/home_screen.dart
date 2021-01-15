import 'package:bienes_servicios/src/blocs/home/botton_navigation/botton_navigation_bloc.dart';
import 'package:bienes_servicios/src/ui/home/body.dart';
import 'package:bienes_servicios/src/ui/home/botton_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => BottonNavigationBloc())],
        child: Scaffold(
          body: Body(),
          bottomNavigationBar: BottonNavigation(),
        ));
  }
}
