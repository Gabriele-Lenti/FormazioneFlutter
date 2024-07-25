import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../Provider/favorites_provider.dart';
import '../Common/table_container_view.dart';
import 'FilterBloc/filter_bloc.dart';
import 'FilterBloc/filter_state.dart';
import 'FilterBloc/filter_events.dart';

class FilterResults extends StatelessWidget {
  const FilterResults({super.key});

  void addFavorite(int index) {
    print("INDEX SELEZIONATO: $index");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
        builder: (BuildContext context, FilterState state) {
      return Column(
        children: [
          SizedBox(
            height: (state.filters?.length ?? 0) > 0 ? 40 : 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: ListView.builder(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  itemCount: state.filters?.length,
                  itemBuilder: (context, index) {
                    if (state.filters?[index] != null) {
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
                          context.read<FilterBloc>().add(state
                                      .filters![index] ==
                                  "RESET"
                              ? ResetFilterEvent()
                              : FilterListEvent(state.filters![index], index));
                        },
                        child: Text(state.filters![index]),
                      );
                    } else {
                      return const SizedBox(
                        height: 0,
                      );
                    }
                  }),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ChangeNotifierProvider(
            create: (context) => FavoritesProvider(),
            child: Expanded(
                child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                return TableContainerView(
                    result: state.result[index],
                    callback: () {
                      addFavorite(index);
                    });
              },
            )),
          )
        ],
      );
    });
  }
}
