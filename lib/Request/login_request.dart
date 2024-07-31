class LoginRequest {
  late String username;
  late String password;
  late int expiresInMins;

  LoginRequest({required this.username, required this.password, required this.expiresInMins});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    data['expiresInMins'] = expiresInMins;
    return data;
  }
}
