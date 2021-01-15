import 'package:bienes_servicios/src/blocs/home/botton_navigation/botton_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottonNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottonNavigationBloc, BottonNavigationState>(
        builder: (context, state) {
      return BottomNavigationBar(
        currentIndex: context.bloc<BottonNavigationBloc>().currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive, color: Colors.black),
            label: 'Second',
          ),
        ],
        onTap: (index) =>
            context.bloc<BottonNavigationBloc>().add(PageTapped(index: index)),
      );
    });
  }
}
