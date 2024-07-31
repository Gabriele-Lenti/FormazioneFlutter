import '../../../Response/artist_collection_response.dart';

class PreferitiEvents {}

class AddOrRemovePreferitiEvent extends PreferitiEvents {
  String id = '';
  Results? preferitoObject;

  AddOrRemovePreferitiEvent(this.id, this.preferitoObject);
}

class GetUpdatedPreferitiEvent extends PreferitiEvents {}

class ResetFilterPreferitiEvent extends PreferitiEvents {}

class FilterListPreferitiEvent extends PreferitiEvents {
  String query = '';
  int? selectedFilterIndex;

  FilterListPreferitiEvent(this.query, this.selectedFilterIndex);
}
