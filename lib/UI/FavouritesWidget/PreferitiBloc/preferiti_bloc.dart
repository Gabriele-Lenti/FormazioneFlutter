
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/Common/FilterUtils.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_events.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_state.dart';
import '../../../Response/artist_collection_response.dart';
import 'package:formazione_flutter/UI/Common/FilterUtils.dart';

class PreferitiBloc extends Bloc<PreferitiEvents, PreferitiState>{

  List<String> preferiti = []; // id
  List<Results> preferitiObjects = []; // oggetti
  List<Results> filteredPreferiti = []; // oggetti filtrati
  List<String> blocFilters = [];

  PreferitiBloc() : super(PreferitiState([], [], [], null)) {
    on<AddOrRemovePreferitiEvent>(onAddOrRemovePreferitiEvent);
    on<GetUpdatedPreferitiEvent>(onGetUpdatedPreferitiEvent);
    on<ResetFilterPreferitiEvent>(onResetFilterPreferiti);
    on<FilterListPreferitiEvent>(onFilterListPreferiti);
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

    blocFilters = FilterUtils.createFilters(preferitiObjects);

    filteredPreferiti = preferitiObjects;

    emit(PreferitiState(preferiti, preferitiObjects, blocFilters, null));
  }

  onGetUpdatedPreferitiEvent(GetUpdatedPreferitiEvent event, Emitter<PreferitiState> emit) async {
    emit(PreferitiState(preferiti, preferitiObjects, blocFilters, null));
  }

  onResetFilterPreferiti(ResetFilterPreferitiEvent event, Emitter<PreferitiState> emit) async {
    filteredPreferiti = preferitiObjects;
    emit(PreferitiState(preferiti, preferitiObjects, blocFilters, null));
  }

  onFilterListPreferiti(FilterListPreferitiEvent event, Emitter<PreferitiState> emit)  async {
    String query = event.query;
    int? selectedFilterIndex = event.selectedFilterIndex;

    filteredPreferiti = preferitiObjects.where((i) => i.kind == query).toList();
    emit(PreferitiState(preferiti, filteredPreferiti, blocFilters, selectedFilterIndex));
  }
}