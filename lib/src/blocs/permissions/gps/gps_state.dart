part of 'gps_bloc.dart';

class GpsState extends Equatable {
  static Position initPosition = Position(latitude: 0, longitude: 0);
  final bool isGranted;
  final bool isDenied;
  final bool isPermanentlyDenied;
  final bool isRestricted;
  //gps is enabled or not
  final bool isServiceEnabled;
  //get current position
  final Position position;
  //init state
  final bool isLoading;
  GpsState(
      {@required this.isGranted,
      @required this.isDenied,
      @required this.isPermanentlyDenied,
      @required this.isRestricted,
      @required this.isServiceEnabled,
      @required this.position,
      @required this.isLoading});

  factory GpsState.initial() {
    return GpsState(
        isGranted: false,
        isDenied: false,
        isPermanentlyDenied: false,
        isRestricted: false,
        isServiceEnabled: false,
        position: initPosition,
        isLoading: true);
  }
  factory GpsState.isGranted() {
    return GpsState(
        isGranted: true,
        isDenied: false,
        isPermanentlyDenied: false,
        isRestricted: false,
        isServiceEnabled: false,
        position: initPosition,
        isLoading: false);
  }
  factory GpsState.isDenied() {
    return GpsState(
        isGranted: false,
        isDenied: true,
        isPermanentlyDenied: false,
        isRestricted: false,
        isServiceEnabled: false,
        position: initPosition,
        isLoading: false);
  }
  factory GpsState.isPermanentlyDenied() {
    return GpsState(
        isGranted: false,
        isDenied: false,
        isPermanentlyDenied: true,
        isRestricted: false,
        isServiceEnabled: false,
        position: initPosition,
        isLoading: false);
  }
  factory GpsState.isRestricted() {
    return GpsState(
        isGranted: false,
        isDenied: false,
        isPermanentlyDenied: false,
        isRestricted: true,
        isServiceEnabled: false,
        position: initPosition,
        isLoading: false);
  }
  factory GpsState.isServiceEnabled() {
    return GpsState(
        isGranted: true,
        isDenied: false,
        isPermanentlyDenied: false,
        isRestricted: false,
        isServiceEnabled: true,
        position: initPosition,
        isLoading: false);
  }
  GpsState copyWith(
      {bool isGranted,
      bool isDenied,
      bool isPermanentlyDenied,
      bool isRestricted,
      bool isServiceEnabled,
      Position position,
      bool isLoading}) {
    return GpsState(
        isGranted: isGranted ?? this.isGranted,
        isDenied: isDenied ?? this.isDenied,
        isPermanentlyDenied: isPermanentlyDenied ?? this.isPermanentlyDenied,
        isRestricted: isRestricted ?? this.isRestricted,
        isServiceEnabled: isServiceEnabled ?? this.isServiceEnabled,
        position: position ?? this.position,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [
        isGranted,
        isDenied,
        isPermanentlyDenied,
        isRestricted,
        isServiceEnabled,
        position,
        isLoading
      ];

  @override
  String toString() {
    return ''' GpsState {
      isGranted:$isGranted,
      isDenied:$isDenied,
      isPermanentlyDenied:$isPermanentlyDenied,
      isRestricted:$isRestricted,
      isServiceEnabled: $isServiceEnabled,
      position: $position,
      isLoading: $isLoading
    ''';
  }
}
