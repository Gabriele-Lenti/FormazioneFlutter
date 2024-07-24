import '../../Response/ArtistCollectionResponse.dart';

enum SearchStatus {
  initial, isLoading, loaded, error
}

class SearchState {}

class InitialSearchState extends SearchState {}

class UpdateSearchState extends SearchState {
  final List<Results>? result;
  SearchStatus status = SearchStatus.initial;
  UpdateSearchState(this.result, this.status);
}

class UpdateErrorState extends SearchState {
  final String error;
  UpdateErrorState(this.error);
}
