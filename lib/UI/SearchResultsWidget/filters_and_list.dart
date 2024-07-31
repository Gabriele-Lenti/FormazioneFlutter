import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/SearchResultsWidget/SearchBloc/search_state.dart';
import 'package:formazione_flutter/UI/Common/filters.dart';

import '../../Response/artist_collection_response.dart';
import '../Common/table_container_view.dart';
import 'SearchBloc/search_bloc.dart';
import 'SearchBloc/search_events.dart';

class FiltersAndList extends StatelessWidget {

  final List<Results> result;
  final List<String> filters;
  final int? selectedFilterIndex;

  const FiltersAndList({super.key, required this.result, required this.filters, required this.selectedFilterIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Filters(filters: filters, selectedFilterIndex: selectedFilterIndex, filter: ((value, index) {
          context.read<SearchBloc>().add(
              value == "RESET"
                  ? ResetFilterEvent()
                  : FilterListEvent(value, index));
        })),
        const SizedBox(
          height: 8,
        ),
        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: result.length,
          itemBuilder: (context, index) {
            return TableContainerView(
                result: result[index]
            );
          }))
      ],
    );
  }
}
