import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<LoginUserEvent, LoginUserState>{
  ProfileBloc() : super(LoginUserState(false, null)){
    on<LoginUserEvent>(onLoginUser);
  }

  Future<void> onLoginUser(LoginUserEvent event, Emitter<LoginUserState> emit) async {
    if(event.username.isNotEmpty && event.password.isNotEmpty){
      emit(LoginUserState(true, event.username));
      print("${event.username} e ${event.password} non sono vuoti");
    }else{
      print("è vuoto");
    }
  }
}