import '../../../Response/artist_collection_response.dart';

class PreferitiState {
  List<String> preferiti = [];
  List<Results> preferitiObj = [];
  List<String> filters = [];
  int? selectedFilterIndex;

  PreferitiState(this.preferiti, this.preferitiObj, this.filters, this.selectedFilterIndex);
}
