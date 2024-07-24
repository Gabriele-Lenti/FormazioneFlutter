import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/bloc/SearchBloc/search_events.dart';
import 'package:formazione_flutter/bloc/SearchBloc/search_state.dart';

import '../../Network/network_manager.dart';
import '../../Response/artist_collection_response.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState>{

  final _networkManager = NetworkManager();

  SearchBloc() : super(InitialSearchState()) {
    on<UpdateSearchEvent>(onUpdateSearch);
  }

  Future<void> onUpdateSearch(UpdateSearchEvent event,Emitter<SearchState> emit) async {
    emit(UpdateSearchState(null, SearchStatus.isLoading));
    try {
      ArtistCollectionResponse response = await _networkManager
          .getArtistCollection(event.searchQuery.replaceAll(" ", "+"));
      List<Results>? results = response.results;
      if (results != null) {
        emit(UpdateSearchState(results, SearchStatus.loaded));
      }
    } catch (e){
      emit(UpdateErrorState(e.toString()));
    }
  }
}
