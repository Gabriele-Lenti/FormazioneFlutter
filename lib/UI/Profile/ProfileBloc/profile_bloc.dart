import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formazione_flutter/Network/network_manager.dart';

import '../../../Response/login_response.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ProfileBloc() : super(LoginUserState(false, null)){
    on<LoginUserEvent>(onLoginUser);
    on<LogoutEvent>(onLogout);
  }

  Future<void> onLoginUser(LoginUserEvent event, Emitter<ProfileState> emit) async {
    if(event.username.isNotEmpty && event.password.isNotEmpty){
      NetworkManager networkManager = NetworkManager();

      try{
        LoginResponse userInfo;
        userInfo = await networkManager.getUserLoginInfo(event.username, event.password);
        emit(LoginUserState(true, userInfo));
        print("${event.username} e ${event.password} non sono vuoti");
      } catch(error){
        print(error);
      }

    }else{
      print("è vuoto");
    }
  }

  Future<void> onLogout(LogoutEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileState());
  }
}