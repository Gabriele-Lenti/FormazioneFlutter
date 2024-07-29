
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/MainScreen/PreferitiBloc/preferiti_events.dart';
import 'package:formazione_flutter/UI/MainScreen/PreferitiBloc/preferiti_state.dart';

class PreferitiBloc extends Bloc<PreferitiEvents, PreferitiState>{

  List<String> preferiti = [];
  PreferitiBloc() : super(PreferitiState([])) {
    on<AddOrRemovePreferitiEvent>(onAddOrRemovePreferitiEvent);
  }

  onAddOrRemovePreferitiEvent(AddOrRemovePreferitiEvent event,Emitter<PreferitiState> emit) async {
    String id = event.id;
    if(preferiti.contains(id)) {
      preferiti.removeWhere((p) => p == id);
    } else {
      preferiti.add(id);
    }
    emit(PreferitiState(preferiti));
  }
}