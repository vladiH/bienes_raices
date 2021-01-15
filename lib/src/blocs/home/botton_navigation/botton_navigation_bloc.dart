import 'package:bienes_servicios/src/repositories/home/first_page/first_page_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'botton_navigation_event.dart';
part 'botton_navigation_state.dart';

class BottonNavigationBloc
    extends Bloc<BottonNavigationEvent, BottonNavigationState> {
  final FirstPageRepository firstPageRepository;
  int currentIndex = 0;
  BottonNavigationBloc({this.firstPageRepository}) : super(FirstPageLoaded());

  @override
  Stream<BottonNavigationState> mapEventToState(
      BottonNavigationEvent event) async* {
    if (event is PageTapped) {
      yield* _mapPageTappedToState(event);
    }
  }

  Stream<BottonNavigationState> _mapPageTappedToState(PageTapped event) async* {
    this.currentIndex = event.index;
    yield CurrentIndexChanged(currentIndex: this.currentIndex);
    if (this.currentIndex == 0) {
      yield FirstPageLoaded();
    }
    if (this.currentIndex == 1) {
      yield SecondPageLoaded();
    }
  }
}
