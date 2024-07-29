import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Network/network_manager.dart';
import '../../../Response/artist_collection_response.dart';
import 'search_events.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState>{

  final _networkManager = NetworkManager();
  List<Results> notFilteredresults = [];
  List<Results> filteredResults = [];
  List<String> blocFilters = [];

  SearchBloc() : super(InitialSearchState()) {
    on<UpdateSearchEvent>(onUpdateSearch);
    on<FilterListEvent>(onFilterList);
    on<ResetFilterEvent>(onResetFilter);
  }

  Future<void> onUpdateSearch(UpdateSearchEvent event,Emitter<SearchState> emit) async {
    emit(UpdateSearchState(null, SearchStatus.isLoading, 0, []));
    try {
      ArtistCollectionResponse response = await _networkManager
          .getArtistCollection(event.searchQuery.replaceAll(" ", "+"));
      List<Results>? results = response.results;
      if (results != null) {
        notFilteredresults = results;
        filteredResults = results;
      }
      List<String> filters = [];
      if (results != null){
        for (var value in results) {
          if (!filters.contains(value.kind)) {
            if (value.kind != null){
              filters.add(value.kind!);
            }
          }
        }
      }

      if (filters.isEmpty) {
        filters = [];
      } else {
        filters.add("RESET");
      }
      blocFilters = filters;
      emit(UpdateSearchState(results, SearchStatus.loaded, 0, filters));
    } catch (e){
      emit(UpdateErrorState(e.toString()));
    }
  }

  void onFilterList(FilterListEvent event, Emitter<SearchState> emit) async {
    String query = event.query;
    int? selectedFilterIndex = event.selectedFilterIndex;

    filteredResults = notFilteredresults.where((i) => i.kind == query).toList();
    emit(UpdateSearchState(filteredResults, SearchStatus.loaded, selectedFilterIndex, blocFilters));
  }

  void onResetFilter(ResetFilterEvent event, Emitter<SearchState> emit) async {
    filteredResults = notFilteredresults;
    emit(UpdateSearchState(filteredResults, SearchStatus.loaded, 0, blocFilters));
  }
}
