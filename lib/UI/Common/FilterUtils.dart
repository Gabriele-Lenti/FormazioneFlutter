import '../../Response/artist_collection_response.dart';

class FilterUtils {
  static List<String> createFilters(List<Results> results) {
    List<String> filters = [];

    for (var value in results) {
      if (!filters.contains(value.kind)) {
        if (value.kind != null) {
          filters.add(value.kind!);
        }
      }
    }

    if (filters.isEmpty) {
      filters = [];
    } else {
      if (filters.length == 1) {
        filters = [];
      } else {
        filters.add("RESET");
      }
    }

    return filters;
  }
}
