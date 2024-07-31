import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/SearchResultsWidget/SearchBloc/search_state.dart';
import 'package:formazione_flutter/UI/SearchResultsWidget/filters.dart';

import '../Common/table_container_view.dart';
import 'SearchBloc/search_bloc.dart';
import 'SearchBloc/search_events.dart';

class FiltersAndList extends StatelessWidget {
  final UpdateSearchState state;

  const FiltersAndList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Filters(filters: state.filters, selectedFilterIndex: state.selectedFilterIndex, filter: ((value, index) {
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
          itemCount: state.result?.length,
          itemBuilder: (context, index) {
            return TableContainerView(
                result: state.result![index]
            );
          }))
      ],
    );
  }
}
