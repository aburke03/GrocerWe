import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocerwe/pages/login_or_register.dart';
import 'homepage.dart';

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
        //user is not logged in
        } else {
          return const LoginOrRegisterPage();
        }
        }
      ), 
    );
  }
}