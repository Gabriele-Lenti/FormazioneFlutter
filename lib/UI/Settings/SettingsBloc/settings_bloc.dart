import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/Settings/SettingsBloc/settings_event.dart';
import 'package:formazione_flutter/UI/Settings/SettingsBloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState>{
  SettingsBloc(): super(DarkModeTappedState(false)){
    on<DarkModeTappedEvent>(onDarkModeTapped);
  }
  Future<void> onDarkModeTapped(DarkModeTappedEvent event, Emitter<SettingsState> emit) async{
    emit(DarkModeTappedState(event.isDark));
  }
}