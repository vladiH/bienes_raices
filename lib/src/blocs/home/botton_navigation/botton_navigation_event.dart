part of 'botton_navigation_bloc.dart';

class BottonNavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PageTapped extends BottonNavigationEvent {
  final int index;
  PageTapped({@required this.index});

  @override
  List<Object> get props => [index];
}
