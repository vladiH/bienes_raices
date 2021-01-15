import 'dart:async';
import 'package:bienes_servicios/src/blocs/home/first_page/ads/ads_bloc.dart';
import 'package:bienes_servicios/src/blocs/home/first_page/slider/slider_bloc.dart';
import 'package:bienes_servicios/src/blocs/permissions/gps/gps_bloc.dart';
import 'package:bienes_servicios/src/ui/widgets/state_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  GpsBloc gpsBloc;
  AdsBloc adsBloc;
  SliderBloc sliderBloc;
  @override
  void initState() {
    super.initState();
    gpsBloc = BlocProvider.of<GpsBloc>(context);
    adsBloc = BlocProvider.of<AdsBloc>(context);
    sliderBloc = BlocProvider.of<SliderBloc>(context);
  }

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        if (state.isLoading && !state.isGranted) {
          gpsBloc.add(CheckGpsPermision());
        }
        if (state.isGranted && !state.isServiceEnabled) {
          gpsBloc.add(GpsServiceEnabled());
        }
        if (state.isDenied) {
          debugPrint("isdenied");
        }
        if (state.isPermanentlyDenied) {
          //gpsBloc.add(OpenGpsSetting());
          debugPrint("isPermanentlyDenied");
        }
        if (state.isRestricted) {
          debugPrint("isRestricted");
        }
        if (state.isServiceEnabled && state.isGranted) {
          /*_goToPosition(
              LatLng(state.position.latitude, state.position.longitude));*/
        }
        return BlocBuilder<AdsBloc, AdsState>(
          builder: (contextAds, adState) {
            print(adState);
            if (adState is LoadingAds) {
              contextAds.bloc<AdsBloc>().add(LoadAds(
                  lat: state.position.latitude,
                  lon: state.position.longitude,
                  km: sliderBloc.value,
                  page: 0,
                  limit: 100));
            }
            if (adState is SuccessLoadAds) {
              return Text("data");
            }
            if (adState is FailureLoadAds) {
              return Text(adState.error);
            }
            return Text("contextAds");
          },
        );
      },
    ));
  }

  Future<void> _goToPosition(LatLng latLng) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition position = CameraPosition(
        bearing: 192.8334901395799,
        target: latLng,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }
}

/*if (state is LoadingAds) {
              contextAds.bloc<AdsBloc>().add(LoadAds(
                  lat: state.position.latitude,
                  lon: state.position.longitude,
                  km: sliderBloc.value,
                  page: 0,
                  limit: 100));
            }
            if (state is SuccessLoadAds) {
              return GoogleMap(
                compassEnabled: true,
                mapType: MapType.satellite,
                initialCameraPosition: CameraPosition(
                  target:
                      LatLng(state.position.latitude, state.position.longitude),
                  zoom: 14.4746,
                  tilt: 59.440717697143555,
                  bearing: 192.8334901395799,
                ),
                onMapCreated: (GoogleMapController controller) {
                  gpsBloc.add(GpsCurrentPosition());
                  adsBloc.add(LoadAds(
                      lat: state.position.latitude,
                      lon: state.position.longitude,
                      km: sliderBloc.value,
                      limit: 100,
                      page: 0));
                  _controller.complete(controller);
                },
                markers: Set.from(adsBloc.getMarkers),
              );
            }*/
