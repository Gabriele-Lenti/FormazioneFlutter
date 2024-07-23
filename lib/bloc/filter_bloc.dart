import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/bloc/filter_events.dart';
import 'package:formazione_flutter/bloc/filter_state.dart';

import '../Network/NetworkManager.dart';
import '../Response/ArtistCollectionResponse.dart';

class FilterBloc extends Bloc<FilterEvents, FilterState>{

  List<Results> notFilteredresults = [];
  List<Results> filteredResults = [];
  final _networkManager = NetworkManager();

  FilterBloc() : super(InitialState()) {
    on<UpdateListEvent>(onUpdateList);
    on<FilterListEvent>(onFilterList);
    on<ResetFilterEvent>(onResetFilter);
    on<UpdateSearchEvent>(onUpdateSearch);
  }

  void onUpdateList(UpdateListEvent event, Emitter<FilterState> emit) async {
    emit(UpdateState(event.results));
  }

  void onFilterList(FilterListEvent event, Emitter<FilterState> emit) async {
    String query = event.query;
    filteredResults = notFilteredresults;
    emit(UpdateState(filteredResults.where((i) => i.kind == query).toList()));
  }

  void onResetFilter(ResetFilterEvent event, Emitter<FilterState> emit) async {
    filteredResults = notFilteredresults;
    emit(UpdateState(notFilteredresults));
  }

  Future<void> onUpdateSearch(UpdateSearchEvent event,Emitter<FilterState> emit) async {
    try {
      ArtistCollectionResponse response = await _networkManager
          .getArtistCollection(event.searchQuery.replaceAll(" ", "+"));
      List<Results>? results = response.results;
      if (results != null) {
        notFilteredresults = results;
        filteredResults = results;
        emit(UpdateState(results));
      }
    } catch (e){
      emit(UpdateErrorState(e.toString()));
    }
  }
}
