part of 'ads_bloc.dart';

class AdsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadAds extends AdsEvent {
  final double lat;
  final double lon;
  final double km;
  final int page;
  final int limit;
  LoadAds(
      {@required this.lat,
      @required this.lon,
      @required this.km,
      @required this.page,
      @required this.limit});
  @override
  List<Object> get props => [lat, lon, km, page, limit];

  @override
  String toString() =>
      'LoadAds { lat: $lat, lon:$lon, km:$km, page:$page, limit:$limit}';
}
