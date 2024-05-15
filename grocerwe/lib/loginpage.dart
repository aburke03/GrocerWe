import 'package:flutter/material.dart';
import 'package:grocerwe/components/my_button.dart';
import 'package:grocerwe/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
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
              
              //Username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 25),


              //Password textfield
              MyTextField(
                controller: usernameController,
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
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(children: [
                  Expanded(child: Divider(
                    thickness: 0.5,
                    color: Colors.black
                    ,)
                    ),
                
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  const SizedBox(width: 4),
                  const Text(
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