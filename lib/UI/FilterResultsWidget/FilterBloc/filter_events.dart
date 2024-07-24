
class FilterEvents {}

class UpdateListEvent extends FilterEvents {}

class FilterListEvent extends FilterEvents {
  String query = '';
  int? selectedFilterIndex;

  FilterListEvent(this.query, this.selectedFilterIndex);
}
class ResetFilterEvent extends FilterEvents {}
