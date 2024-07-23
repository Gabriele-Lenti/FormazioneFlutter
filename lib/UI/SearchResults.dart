import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/Response/ArtistCollectionResponse.dart';
import 'package:formazione_flutter/UI/Common/TableContainerView.dart';
import 'package:formazione_flutter/bloc/filter_events.dart';
import 'package:formazione_flutter/bloc/filter_state.dart';

import '../Network/NetworkManager.dart';
import '../bloc/filter_bloc.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final _networkManager = NetworkManager();
  String searchText = "";

  void onQueryChanged(String text) {
    context.read<FilterBloc>().add(UpdateSearchEvent(text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
        builder: (BuildContext context, FilterState state) {
          if (state is UpdateErrorState) {
            return Column(children: [
              SearchBar(onChanged: onQueryChanged),
              const SizedBox(height: 20),
              Expanded(child: Text(state.error))
            ]);
          }
      if (state is InitialState) {
        return Column(children: [
          SearchBar(onChanged: onQueryChanged),
          const SizedBox(height: 20),
          Expanded(child: Container())
        ]);
      }
      if (state is UpdateState) {
        return Column(children: [
          SearchBar(onChanged: onQueryChanged),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  context
                      .read<FilterBloc>()
                      .add(FilterListEvent("feature-movie"));
                },
                child: Text('MOVIE'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  context.read<FilterBloc>().add(FilterListEvent("song"));
                },
                child: Text('MUSIC'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  context.read<FilterBloc>().add(ResetFilterEvent());
                },
                child: Text('RESET'),
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
        ]);
      }
      return Container();
    });
  }
}
