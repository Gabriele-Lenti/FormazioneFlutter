import '../../../Response/artist_collection_response.dart';

enum SearchStatus {
  initial, isLoading, loaded, error
}

class SearchState {}

class InitialSearchState extends SearchState {}

class UpdateSearchState extends SearchState {
  final List<Results>? result;
  final List<String> filters;
  int? selectedFilterIndex;
  SearchStatus status = SearchStatus.initial;

  UpdateSearchState(this.result, this.status, this.selectedFilterIndex, this.filters);
}

class UpdateErrorState extends SearchState {
  final String error;
  UpdateErrorState(this.error);
}
