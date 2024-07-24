
class FilterEvents {}

class UpdateListEvent extends FilterEvents {}

class FilterListEvent extends FilterEvents {
  String query = '';
  FilterListEvent(this.query);
}
class ResetFilterEvent extends FilterEvents {}
