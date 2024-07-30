
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_events.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_state.dart';
import '../../../Response/artist_collection_response.dart';

class PreferitiBloc extends Bloc<PreferitiEvents, PreferitiState>{

  List<String> preferiti = [];
  List<Results> preferitiObjects = [];

  PreferitiBloc() : super(PreferitiState([], [])) {
    on<AddOrRemovePreferitiEvent>(onAddOrRemovePreferitiEvent);
    on<GetUpdatedPreferitiEvent>(onGetUpdatedPreferitiEvent);
  }

  onAddOrRemovePreferitiEvent(AddOrRemovePreferitiEvent event,Emitter<PreferitiState> emit) async {
    String id = event.id;

    if(preferiti.contains(id)) {
      preferiti.removeWhere((p) => p == id);
      preferitiObjects.removeWhere((p) {
        return id == p.trackId.toString()+p.collectionId.toString() || id == (p.artistId.toString()+p.trackId.toString());
      });
    } else {
      preferiti.add(id);
      if (event.preferitoObject != null) {
        preferitiObjects.add(event.preferitoObject!);
      }
    }
    emit(PreferitiState(preferiti, preferitiObjects));
  }

  onGetUpdatedPreferitiEvent(GetUpdatedPreferitiEvent event, Emitter<PreferitiState> emit) async {
    emit(PreferitiState(preferiti, preferitiObjects));
  }
}