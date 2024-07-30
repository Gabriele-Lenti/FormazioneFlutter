
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ProfileBloc/profile_bloc.dart';
import '../ProfileBloc/profile_event.dart';

class LoginWidget extends StatelessWidget{
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String username = "";
    String password = "";
    return Center(
      child: Container(
        height: 250,
        width: 350,
        child: Card(
          color: Colors.deepPurple.shade50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextField(
                      onChanged: (value){
                        username = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "User",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextField(
                      onChanged: (value){
                        password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password"
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                    onPressed: (){
                      context.read<ProfileBloc>().add(LoginUserEvent(username,password));
                    },
                    child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, ),)
                )
              ],
            ),
        ),
      ),
    );
  }

}