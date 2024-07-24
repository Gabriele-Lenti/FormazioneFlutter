import 'package:flutter_bloc/flutter_bloc.dart';

import "../../../Response/artist_collection_response.dart";

import "filter_events.dart";
import "filter_state.dart";

class FilterBloc extends Bloc<FilterEvents, FilterState>{

  List<Results> notFilteredresults = [];
  List<Results> filteredResults = [];
  List<String> blocFilters = [];

  FilterBloc(List<Results> result, List<String> filters) : super(FilterState(result, filters, null)) {
    notFilteredresults = result;
    filteredResults = result;
    blocFilters = filters;

    if (filters.isNotEmpty) {
      blocFilters.add("RESET");
    }

    on<FilterListEvent>(onFilterList);
    on<ResetFilterEvent>(onResetFilter);
  }

  void onFilterList(FilterListEvent event, Emitter<FilterState> emit) async {
    String query = event.query;
    int? selectedFilterIndex = event.selectedFilterIndex;

    filteredResults = notFilteredresults.where((i) => i.kind == query).toList();
    emit(FilterState(filteredResults, blocFilters, selectedFilterIndex));
  }

  void onResetFilter(ResetFilterEvent event, Emitter<FilterState> emit) async {
    filteredResults = notFilteredresults;
    emit(FilterState(notFilteredresults, blocFilters, null));
  }
}
