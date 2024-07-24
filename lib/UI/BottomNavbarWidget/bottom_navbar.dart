import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/BottomNavbarWidget/BottomNavbarBloc/bottom_navbar_bloc.dart';
import 'package:formazione_flutter/UI/BottomNavbarWidget/BottomNavbarBloc/bottom_navbar_state.dart';
import 'BottomNavbarBloc/bottom_navbar_events.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  void onItemTapped(BuildContext context, int index) {
    context.read<BottomNavbarBloc>().add(OnTabChangedEvent(index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
      builder: (BuildContext context, BottomNavbarState state) {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Cerca',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Preferiti',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profilo',
            ),
          ],
          currentIndex: state.selectedIndex,
          selectedItemColor: Colors.deepPurple[800],
          onTap: ((index) => onItemTapped(context, index)),
        );
      },
    );
  }
}
