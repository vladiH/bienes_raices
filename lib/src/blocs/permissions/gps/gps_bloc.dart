import 'package:bienes_servicios/src/blocs/permissions/request_premission.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' hide openAppSettings;
import 'package:permission_handler/permission_handler.dart';
part 'gps_state.dart';
part 'gps_event.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc() : super(GpsState.initial());

  @override
  Stream<GpsState> mapEventToState(GpsEvent event) async* {
    if (event is GpsCurrentPosition) {
      yield* _mapGpsCurrentPositionToState();
    }
    if (event is CheckGpsPermision) {
      yield* _mapCheckGpsPermisionToState();
    }
    if (event is GpsServiceEnabled) {
      yield* _mapGpsServiceEnabledToState();
    }
    if (event is OpenGpsSetting) {
      openAppSettings();
    }
  }

  Stream<GpsState> _mapGpsCurrentPositionToState() async* {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    yield state.copyWith(
        isGranted: true,
        isDenied: false,
        isPermanentlyDenied: false,
        isRestricted: false,
        isServiceEnabled: true,
        position: position,
        isLoading: false);
  }

  Stream<GpsState> _mapCheckGpsPermisionToState() async* {
    int permission = await requestPermissions(Permission.location);
    switch (permission) {
      case 0:
        yield GpsState.isGranted();
        break;
      case 1:
        yield GpsState.isDenied();
        break;
      case 2:
        yield GpsState.isPermanentlyDenied();
        break;
      case 3:
        yield GpsState.isRestricted();
        break;
      default:
        yield state.copyWith(
            isGranted: false,
            isDenied: false,
            isPermanentlyDenied: false,
            isRestricted: false,
            isServiceEnabled: false,
            position: Position(latitude: -13.52264, longitude: -71.96734),
            isLoading: false);
    }
  }

  Stream<GpsState> _mapGpsServiceEnabledToState() async* {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationServiceEnabled) {
      yield GpsState.isServiceEnabled();
    } else {
      yield state.copyWith(
          isGranted: false,
          isDenied: false,
          isPermanentlyDenied: false,
          isRestricted: false,
          isServiceEnabled: false,
          position: Position(latitude: -13.52264, longitude: -71.96734),
          isLoading: false);
    }
  }

  Future<Position> get currentPossition async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
