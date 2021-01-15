import 'package:bienes_servicios/src/blocs/home/first_page/ads/ads_bloc.dart';
import 'package:bienes_servicios/src/blocs/home/first_page/slider/slider_bloc.dart';
import 'package:bienes_servicios/src/blocs/permissions/gps/gps_bloc.dart';
import 'package:bienes_servicios/src/repositories/home/first_page/first_page_repository.dart';
import 'package:bienes_servicios/src/ui/home/first_page/maps.dart';
import 'package:bienes_servicios/src/ui/home/first_page/slider_km.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'top_navigation.dart';

class FirstPageScreen extends StatelessWidget {
  const FirstPageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FirstPageRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AdsBloc(
                  firstPageRepository:
                      RepositoryProvider.of<FirstPageRepository>(context))),
          BlocProvider(create: (context) => GpsBloc()),
          BlocProvider(
              create: (context) =>
                  SliderBloc(max: 100, min: 0, divisions: 20, value: 5.0))
        ],
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Maps(),
              SliderKm(),
              TopNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}
