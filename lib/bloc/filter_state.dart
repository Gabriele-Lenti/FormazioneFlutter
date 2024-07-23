import '../Response/ArtistCollectionResponse.dart';

class FilterState {}

class InitialState extends FilterState {}
class UpdateState extends FilterState {
  final List<Results> result;
  UpdateState(this.result);
}
class UpdateSearchState extends FilterState {
  final String searchQuery;
  UpdateSearchState(this.searchQuery);
}
