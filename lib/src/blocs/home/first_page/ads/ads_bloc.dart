import 'package:bienes_servicios/src/models/ad.dart';
import 'package:bienes_servicios/src/models/response.dart';
import 'package:bienes_servicios/src/repositories/home/first_page/first_page_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
part 'ads_state.dart';
part 'ads_event.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final FirstPageRepository firstPageRepository;
  List<Ad> _ads;
  List<Marker> _markers = [];
  AdsBloc({@required this.firstPageRepository}) : super(LoadingAds());

  @override
  Stream<AdsState> mapEventToState(AdsEvent event) async* {
    if (event is LoadAds) {
      yield* _mapLoadAdsToState(event);
    }
  }

  @override
  Stream<Transition<AdsEvent, AdsState>> transformEvents(
    Stream<AdsEvent> events,
    TransitionFunction<AdsEvent, AdsState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! LoadAds);
    });
    final debounceStream = events.where((event) {
      return (event is LoadAds);
    }).debounceTime(Duration(minutes: 5));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  Stream<AdsState> _mapLoadAdsToState(LoadAds event) async* {
    try {
      final Response response = await firstPageRepository.showAds(
          event.lat, event.lon, event.km, event.page, event.limit);
      print(response.getSuccess);
      if (response.getSuccess) {
        var data = response.data as List;
        _ads = data.map((e) => Ad.fromJson(e));
        setMakers(_ads);
        yield SuccessLoadAds(_ads);
      } else {
        String error = response.errors[0].getMessage;
        yield FailureLoadAds(error);
      }
    } catch (err) {
      String error = err.message ?? 'An unknown error occured';
      yield FailureLoadAds(error);
    }
  }

  List<Marker> get getMarkers {
    return _markers;
  }

  void setMakers(List<Ad> ads) {
    List<Marker> markers = ads.map((e) => Marker(
        markerId: MarkerId(e.id_anuncio.toString()),
        position: LatLng(e.latitud, e.latitud),
        infoWindow:
            InfoWindow(title: "234M2", snippet: e.valor_dolares.toString())));
    this._markers = markers;
  }
}
