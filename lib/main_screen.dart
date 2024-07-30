
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/BottomNavbarWidget/BottomNavbarBloc/bottom_navbar_state.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_bloc.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_events.dart';

import 'UI/BottomNavbarWidget/BottomNavbarBloc/bottom_navbar_bloc.dart';
import 'UI/FavouritesWidget/favourites_widget.dart';
import 'UI/SearchResultsWidget/SearchBloc/search_bloc.dart';
import 'UI/SearchResultsWidget/search_results.dart';

class MainScreen extends StatelessWidget {

  MainScreen({super.key});

  Widget navigate(BuildContext context, Pages pageSelected) {
    switch (pageSelected) {
      case Pages.search:
        return BlocProvider.value(
          value: BlocProvider.of<SearchBloc>(context),
          child: const SearchResults(),
        );
      case Pages.favourites:
        return BlocProvider.value(
          value: BlocProvider.of<PreferitiBloc>(context),
          child: const FavouritesWidget(),
        );
      case Pages.profile:
        return const Text("Profilo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
        builder: (BuildContext context, BottomNavbarState state) {
          return navigate(context, state.selectedPage);
        });
  }
}