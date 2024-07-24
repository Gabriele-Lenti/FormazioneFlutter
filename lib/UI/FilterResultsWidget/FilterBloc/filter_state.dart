import '../../../Response/artist_collection_response.dart';

class FilterState {
  final List<Results> result;
  final List<String>? filters;
  int? selectedFilterIndex;

  FilterState(this.result, this.filters, this.selectedFilterIndex);
}


