import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/Settings/SettingsBloc/settings_bloc.dart';
import 'package:formazione_flutter/UI/Settings/SettingsBloc/settings_event.dart';
import 'package:formazione_flutter/UI/Settings/SettingsBloc/settings_state.dart';

class SettingsWidgets extends StatelessWidget {
  const SettingsWidgets({super.key});

  void DarkModeTapped(BuildContext context, bool isDark) {
    context.read<SettingsBloc>().add(DarkModeTappedEvent(isDark));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
      if (state is DarkModeTappedState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(""),
            elevation: 5,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dark Mode"),
              SizedBox(width: 40,),
              Switch(
                value: state.isDark,
                  onChanged: (bool newValue) {
                    DarkModeTapped(context, newValue);
                  }),
            ],
          ),
        );
      } else {
        return Column(
          children: [
            Text("testo")
          ],
        );
      }
    });
  }
}
