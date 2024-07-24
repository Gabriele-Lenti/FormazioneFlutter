import 'package:flutter_bloc/flutter_bloc.dart';
import "bottom_navbar_events.dart";
import "bottom_navbar_state.dart";

class BottomNavbarBloc extends Bloc<BottomNavbarEvents, BottomNavbarState>{

  BottomNavbarBloc() : super(BottomNavbarState(0)) {
    on<OnTabChangedEvent>(onTabChanged);
  }

  void onTabChanged(OnTabChangedEvent event, Emitter<BottomNavbarState> emit) async {
    int currentIndex = event.selectedTabIndex;
    emit(BottomNavbarState(currentIndex));
  }
}