import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/bloc/FilterBloc/filter_bloc.dart';
import 'package:formazione_flutter/bloc/FilterBloc/filter_events.dart';

import '../bloc/FilterBloc/filter_state.dart';
import 'Common/table_container_view.dart';

class FilterResults extends StatelessWidget {
  const FilterResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
        builder: (BuildContext context, FilterState state) {
      return Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                itemCount: state.filters?.length,

                itemBuilder: (context, index) {
                  if (state.filters?[index] != null) {
                    return TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        context.read<FilterBloc>().add(
                            state.filters![index] == "RESET"
                                ? ResetFilterEvent()
                                : FilterListEvent(state.filters![index]));
                      },
                      child: Text(state.filters![index]),
                    );
                  } else {
                    return const SizedBox(height: 0,);
                  }
                }),
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.result.length,
            itemBuilder: (context, index) {
              return TableContainerView(result: state.result[index]);
            },
          ))
        ],
      );
    });
  }
}
