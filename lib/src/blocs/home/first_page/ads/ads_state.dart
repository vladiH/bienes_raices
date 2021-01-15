part of 'ads_bloc.dart';

class AdsState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingAds extends AdsState {}

class SuccessLoadAds extends AdsState {
  final List<Ad> ads;
  SuccessLoadAds(this.ads);
  @override
  List<Object> get props => [ads];
}

class FailureLoadAds extends AdsState {
  final String error;
  FailureLoadAds(this.error);
  @override
  List<Object> get props => [error];
}
