class ProfileEvent {}

class LoginUserEvent extends ProfileEvent{
  late String username;
  late String password;
  LoginUserEvent(this.username, this.password);
}

class LogoutEvent extends ProfileEvent{}

