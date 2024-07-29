import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/SearchResultsWidget/SearchBloc/search_state.dart';

import '../Common/table_container_view.dart';
import '../SearchResultsWidget/SearchBloc/search_bloc.dart';
import '../SearchResultsWidget/SearchBloc/search_events.dart';

class FilterResults extends StatelessWidget {
  final UpdateSearchState state;

  const FilterResults({super.key, required this.state});

  void addFavorite(BuildContext context, int index) {
    print("INDEX SELEZIONATO: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (state.filters.isNotEmpty) ? 40 : 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: ListView.builder(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                itemCount: state.filters.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    style: ButtonStyle(
                        backgroundColor: state.selectedFilterIndex == index
                            ? WidgetStateProperty.all(Colors.deepPurple)
                            : WidgetStateProperty.all(Colors.transparent),
                        foregroundColor: state.selectedFilterIndex == index
                            ? WidgetStateProperty.all<Color>(Colors.white)
                            : WidgetStateProperty.all<Color>(
                                Colors.deepPurple)),
                    onPressed: () {
                      context.read<SearchBloc>().add(
                          state.filters[index] == "RESET"
                              ? ResetFilterEvent()
                              : FilterListEvent(state.filters[index], index));
                    },
                    child: Text(state.filters[index]),
                  );
                }),
          ),
        ),
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
