part of 'botton_navigation_bloc.dart';

class BottonNavigationState extends Equatable {
  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends BottonNavigationState {
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex});
  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class FirstPageLoaded extends BottonNavigationState {}

class SecondPageLoaded extends BottonNavigationState {}
