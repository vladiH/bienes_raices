part of 'gps_bloc.dart';

class GpsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GpsServiceEnabled extends GpsEvent {}

class GpsCurrentPosition extends GpsEvent {}

class CheckGpsPermision extends GpsEvent {}

class RequestPermision extends GpsEvent {}

class OpenGpsSetting extends GpsEvent {}
