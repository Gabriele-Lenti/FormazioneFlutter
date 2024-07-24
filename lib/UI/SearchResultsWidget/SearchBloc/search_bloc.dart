import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Network/network_manager.dart';
import '../../../Response/artist_collection_response.dart';
import 'search_events.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState>{

  final _networkManager = NetworkManager();

  SearchBloc() : super(InitialSearchState()) {
    on<UpdateSearchEvent>(onUpdateSearch);
  }

  Future<void> onUpdateSearch(UpdateSearchEvent event,Emitter<SearchState> emit) async {
    emit(UpdateSearchState(null, SearchStatus.isLoading, []));
    try {
      ArtistCollectionResponse response = await _networkManager
          .getArtistCollection(event.searchQuery.replaceAll(" ", "+"));
      List<Results>? results = response.results;
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

      if (filters.length == 1) {
        filters = [];
      }

      emit(UpdateSearchState(results, SearchStatus.loaded, filters));
    } catch (e){
      emit(UpdateErrorState(e.toString()));
    }
  }
}
