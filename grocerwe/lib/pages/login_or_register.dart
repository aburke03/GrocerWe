import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'registerpage.dart';


class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => LoginOrRegisterPageState();
}

class LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

  bool showLoginPage = true;

  //toggle between register and login page
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


   @override
    Widget build(BuildContext context) {
      if (showLoginPage){
        return LoginPage(
          onTap: togglePages,
          );
      } else {
        return RegisterPage(
          onTap: togglePages,
        );
      }  
    }
  }