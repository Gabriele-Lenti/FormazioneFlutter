import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/bloc/FilterBloc/filter_events.dart';
import 'package:formazione_flutter/bloc/FilterBloc/filter_state.dart';

import '../../Response/artist_collection_response.dart';

class FilterBloc extends Bloc<FilterEvents, FilterState>{

  List<Results> notFilteredresults = [];
  List<Results> filteredResults = [];
  List<String> blocFilters = [];

  FilterBloc(List<Results> result, List<String> filters) : super(FilterState(result, filters)) {
    notFilteredresults = result;
    filteredResults = result;
    blocFilters = filters;
    blocFilters.add("RESET");
    on<FilterListEvent>(onFilterList);
    on<ResetFilterEvent>(onResetFilter);
  }

  void onFilterList(FilterListEvent event, Emitter<FilterState> emit) async {
    String query = event.query;
    filteredResults = notFilteredresults.where((i) => i.kind == query).toList();
    emit(FilterState(filteredResults, blocFilters));
  }

  void onResetFilter(ResetFilterEvent event, Emitter<FilterState> emit) async {
    filteredResults = notFilteredresults;
    emit(FilterState(notFilteredresults, blocFilters));
  }
}
