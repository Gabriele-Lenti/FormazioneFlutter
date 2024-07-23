import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/bloc/filter_events.dart';
import 'package:formazione_flutter/bloc/filter_state.dart';

import '../Response/ArtistCollectionResponse.dart';

class FilterBloc extends Bloc<FilterEvents, FilterState>{

  List<Results> results = [];
  List<Results> filteredResults = [];

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
    event.filteredResults = event.results;
    emit(UpdateState(event.filteredResults.where((i) => i.kind == query).toList()));
  }

  void onResetFilter(ResetFilterEvent event, Emitter<FilterState> emit) async {
    event.filteredResults = event.results;
    emit(UpdateState(event.results));
  }

  void onUpdateSearch(UpdateSearchEvent event,Emitter<FilterState> emit) async {
    emit(UpdateSearchState(event.searchQuery.replaceAll(" ", "+")));
  }
}
