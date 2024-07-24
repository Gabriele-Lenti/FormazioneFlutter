import 'package:flutter/cupertino.dart';
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
          Row(
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  context
                      .read<FilterBloc>()
                      .add(FilterListEvent("feature-movie"));
                },
                child: const Text('MOVIE'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  context.read<FilterBloc>().add(FilterListEvent("song"));
                },
                child: const Text('MUSIC'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  context.read<FilterBloc>().add(ResetFilterEvent());
                },
                child: const Text('RESET'),
              )
            ],
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
