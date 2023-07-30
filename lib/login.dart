import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'ouath.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  String photo = "";
  String email = "";
  _doLogin() async {
    UserCredential userInfo = await signInWithGoogle();
    name = userInfo.user!.displayName!;
    photo = userInfo.user!.photoURL!;
    email = userInfo.user!.email!;
    
    setState(() {});
  }

  _doLogout() async {
    await signOutGoogle();
    name = '';
    photo = '';
    email = "";
    
    setState(() {});
  }

  String defaultPhoto =
      "https://cdn-icons-png.flaticon.com/128/2202/2202112.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          TextButton(
            child: Text(
                style: TextStyle(fontSize: 15, color: Colors.black), 'Logout'),
            onPressed: () {

              _doLogout();
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            child: Text('Login with Gmail'),
            onPressed: () {

              _doLogin();
     
            },
          ),
          Text(
            name,
            style: TextStyle(fontSize: 30),
          ),
          Image.network(photo.length == 0 ? defaultPhoto : photo),
          SizedBox(
            height: 8,
          ),
          Text(
            email,
            style: TextStyle(fontSize: 20),
          )
        ],
      )),
    );
  }
}
