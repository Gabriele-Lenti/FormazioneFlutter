import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/SearchResultsWidget/filters_and_list.dart';
import 'SearchBloc/search_bloc.dart';
import 'SearchBloc/search_events.dart';
import 'SearchBloc/search_state.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  final String searchText = "";

  void onQuerySubmitted(BuildContext context, String text) {
    context.read<SearchBloc>().add(UpdateSearchEvent(text));
  }

  void onQueryChanged(BuildContext context, String text) {
    if (text.isEmpty) {
      context.read<SearchBloc>().add(UpdateSearchEvent(text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        // onSubmitted: ogni volta che premo invio cerca, onChanged: ogni volta che inserisco una lettera
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBar(
            onSubmitted: ((value) => onQuerySubmitted(context, value)),
            onChanged: ((value) => onQueryChanged(context, value)),
            hintText: "Cerca...",
            leading: const Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 20),
        BlocBuilder<SearchBloc, SearchState>(
            builder: (BuildContext context, SearchState state) {
          if (state is UpdateErrorState) {
            return Expanded(child: Text(state.error));
          }
          if (state is InitialSearchState) {
            return Expanded(
              child: Center(
                child: SizedBox(
                  child: Image.asset('lib/assets/empty-res.png'),
                  height: 150,
                  width: 150,
                ),
              ),
            );
          }
          if (state is UpdateSearchState) {
            if (state.status == SearchStatus.isLoading) {
              return const Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            } else {
              if (state.result != null) {
                if (state.result!.length > 0) {
                  return Expanded(
                    //passare anche state preferiti
                    child: FiltersAndList(state: state),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: SizedBox(
                        child: Image.asset('lib/assets/empty-res.png'),
                        height: 150,
                        width: 150,
                      ),
                    ),
                  );
                }
              } else {
                return Container();
              }
            }
          }
          return Container();
        }),
      ],
    ));
  }
}
