
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/MainScreen/PreferitiBloc/preferiti_bloc.dart';

import '../BottomNavbarWidget/BottomNavbarBloc/bottom_navbar_bloc.dart';
import '../SearchResultsWidget/SearchBloc/search_bloc.dart';
import '../SearchResultsWidget/search_results.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
        BlocProvider<PreferitiBloc>(create: (context) => PreferitiBloc())
    ],
    child: const SearchResults()
    );
  }
}