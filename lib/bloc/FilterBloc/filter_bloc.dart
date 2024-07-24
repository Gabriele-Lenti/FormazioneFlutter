import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/bloc/FilterBloc/filter_events.dart';
import 'package:formazione_flutter/bloc/FilterBloc/filter_state.dart';

import '../../Response/ArtistCollectionResponse.dart';

class FilterBloc extends Bloc<FilterEvents, FilterState>{

  List<Results> notFilteredresults = [];
  List<Results> filteredResults = [];

  FilterBloc(List<Results> result) : super(FilterState(result)) {
    notFilteredresults = result;
    filteredResults = result;
    on<FilterListEvent>(onFilterList);
    on<ResetFilterEvent>(onResetFilter);
  }

  void onFilterList(FilterListEvent event, Emitter<FilterState> emit) async {
    String query = event.query;
    filteredResults = notFilteredresults;
    emit(FilterState(filteredResults.where((i) => i.kind == query).toList()));
  }

  void onResetFilter(ResetFilterEvent event, Emitter<FilterState> emit) async {
    filteredResults = notFilteredresults;
    emit(FilterState(notFilteredresults));
  }
}
