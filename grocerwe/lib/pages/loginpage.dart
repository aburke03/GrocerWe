import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocerwe/components/my_button.dart';
import 'package:grocerwe/components/my_textfield.dart';
import 'dart:async';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const SizedBox(height: 50), 
              //logo
              const Icon(
                Icons.shopping_cart,
                size: 100,
                ),

              const SizedBox(height: 50), 

              //Welcome Text
              const Text(
                'Welcome back ',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold

                ),
              ),

              const SizedBox(height: 25),
              
              //email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 25),


              //Password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),
              //Forgot Password
              const Text('Forgot Passsword?'),

              const SizedBox(height: 25),

              //Sign In Button
              MyButton(
                onTap: signUserIn,
              ),
              const SizedBox(height: 50),

              //or continue with
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(children: [
                  Expanded(child: Divider(
                    thickness: 0.5,
                    color: Colors.black
                    ,)
                    ),
                
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.black)
                    ),
                  ),
                  Expanded(child: Divider(
                  thickness: 0.5,
                  color: Colors.black
                    ,)
                  ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
              //not a member?
               const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.black),

                  ),
                  SizedBox(width: 4),
                  Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    )
                  )

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}