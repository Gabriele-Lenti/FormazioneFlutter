import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/UI/Profile/LoginWidget/login_widget.dart';
import 'package:formazione_flutter/UI/Profile/ProfileBloc/profile_bloc.dart';
import 'package:formazione_flutter/UI/Profile/ProfileBloc/profile_event.dart';
import 'package:formazione_flutter/UI/Profile/ProfileBloc/profile_state.dart';

import 'LoggedInWidget/logged_in_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  void Logout(BuildContext context) {
    context.read<ProfileBloc>().add(LogoutEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
      if (state is LoginUserState) {
        if (state.isLogged) {
          if (state.loginResponse != null) {
            return LoggedInWidget(
              loginResponse: state.loginResponse!,
              logout: () {
                Logout(context);
              },
            );
          } else {
            return const LoginWidget();
          }
        } else {
          return const LoginWidget();
        }
      } else {
        return const LoginWidget();
      }
    });
  }
}
