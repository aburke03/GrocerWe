import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'loginpage.dart';
import 'dart:async';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //if the user is logged in, return the home page
          if(snapshot.hasData){
            return HomePage();

        } else {
          return LoginPage();
        }
        }
      ), 
    );
  }
}