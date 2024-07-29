class SearchEvents {}

class UpdateSearchEvent extends SearchEvents {
  String searchQuery = '';
  UpdateSearchEvent(this.searchQuery);
}


class UpdateListEvent extends SearchEvents {}

class FilterListEvent extends SearchEvents {
  String query = '';
  int? selectedFilterIndex;

  FilterListEvent(this.query, this.selectedFilterIndex);
}

class ResetFilterEvent extends SearchEvents {}
