import '../../../Response/login_response.dart';

class ProfileState{}

class LoginUserState extends ProfileState{
  bool isLogged;
  LoginResponse? loginResponse;
  LoginUserState(this.isLogged, this.loginResponse);
}