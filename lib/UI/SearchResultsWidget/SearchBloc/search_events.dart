class SearchEvents {}

class UpdateSearchEvent extends SearchEvents {
  String searchQuery = '';
  UpdateSearchEvent(this.searchQuery);
}
