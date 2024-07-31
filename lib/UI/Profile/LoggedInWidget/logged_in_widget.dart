import 'package:flutter/material.dart';

import '../../../Response/login_response.dart';

class LoggedInWidget extends StatelessWidget {
  LoggedInWidget(
      {super.key, required this.loginResponse, required this.logout});

  LoginResponse loginResponse;
  final Function() logout;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(64.0)),
              color: Colors.deepPurple,
              child: Image.network(loginResponse.image ?? ""),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${loginResponse.firstName} ${loginResponse.lastName}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Icon(
                  Icons.face,
                  color: loginResponse.gender == "male"
                      ? Colors.blue
                      : Colors.pink,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text("Email : ${loginResponse.email}"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Username : ${loginResponse.username}"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: OutlinedButton(
                onPressed: logout,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.deepPurple),
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
