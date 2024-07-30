import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/BottomNavbarWidget/BottomNavbarBloc/bottom_navbar_bloc.dart';
import 'package:formazione_flutter/UI/FavouritesWidget/PreferitiBloc/preferiti_bloc.dart';
import 'package:formazione_flutter/UI/SearchResultsWidget/search_results.dart';
import 'UI/BottomNavbarWidget/bottom_navbar.dart';
import 'main_screen.dart';
import 'UI/SearchResultsWidget/SearchBloc/search_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavbarBloc>(
              create: (context) => BottomNavbarBloc()),
          BlocProvider<PreferitiBloc>(create: (context) => PreferitiBloc()),
          BlocProvider<SearchBloc>(create: (context) => SearchBloc())
        ],
        child: MaterialApp(
          title: 'iTunes Search',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Formazione Flutter'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body:
          MainScreen(), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
