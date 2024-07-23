import '../Response/ArtistCollectionResponse.dart';

class FilterEvents {
  List<Results> results = [];
  List<Results> filteredResults = [];

}

class UpdateListEvent extends FilterEvents {}

class UpdateSearchEvent extends FilterEvents {
  String searchQuery = '';
  UpdateSearchEvent(this.searchQuery);
}

class FilterListEvent extends FilterEvents {
  String query = '';
  FilterListEvent(this.query);
}
class ResetFilterEvent extends FilterEvents {}
