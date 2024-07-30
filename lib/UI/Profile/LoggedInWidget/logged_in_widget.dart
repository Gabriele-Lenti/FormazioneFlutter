import 'package:flutter/cupertino.dart';

class LoggedInWidget extends StatelessWidget{
  LoggedInWidget({super.key, required this.username});
  String username;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$username"),
    );
  }

}