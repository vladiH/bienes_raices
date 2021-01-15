import 'package:bienes_servicios/src/blocs/home/botton_navigation/botton_navigation_bloc.dart';
import 'package:bienes_servicios/src/ui/home/first_page/first_page_screen.dart';
import 'package:bienes_servicios/src/ui/home/second_page/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottonNavigationBloc, BottonNavigationState>(
      builder: (context, state) {
        if (state is FirstPageLoaded) {
          return FirstPageScreen();
        }
        if (state is SecondPageLoaded) {
          return SecondPage();
        }
        return Container(
          child: Text("error"),
        );
      },
    );
  }
}
