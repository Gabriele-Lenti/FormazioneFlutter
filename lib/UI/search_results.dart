import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/filter_results.dart';

import '../bloc/FilterBloc/filter_bloc.dart';
import '../bloc/SearchBloc/search_bloc.dart';
import 'package:formazione_flutter/bloc/SearchBloc/search_events.dart';
import 'package:formazione_flutter/bloc/SearchBloc/search_state.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});
  final String searchText = "";

  void onQueryChanged(BuildContext context, String text) {
    context.read<SearchBloc>().add(UpdateSearchEvent(text));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchBar(onChanged: ((value) => onQueryChanged(context, value))),
          const SizedBox(height: 20),
          BlocBuilder<SearchBloc, SearchState>(
              builder: (BuildContext context, SearchState state) {
            if (state is UpdateErrorState) {
              return Expanded(child: Text(state.error));
            }
            if (state is InitialSearchState) {
              return Expanded(
                  child: BlocProvider<FilterBloc>(
                create: (context) => FilterBloc([], []),
                child: const FilterResults(),
              ));
            }
            if (state is UpdateSearchState) {
              if (state.status == SearchStatus.isLoading) {
                return const Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ));
              } else {
                if (state.result != null) {
                  return Expanded(
                      child: BlocProvider<FilterBloc>(
                    create: (context) =>
                        FilterBloc(state.result!, state.filter),
                    child: const FilterResults(),
                  ));
                } else {
                  return Container();
                }
              }
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
