class ProfileState{}

class LoginUserState extends ProfileState{
  bool isLogged;
  String? username;
  LoginUserState(this.isLogged, this.username);
}