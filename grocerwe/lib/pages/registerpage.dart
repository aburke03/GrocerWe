// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocerwe/components/my_button.dart';
import 'package:grocerwe/components/my_textfield.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap; 
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();


//sign user up method
void signUserUp() async {
  //show loading circle
  showDialog(
    context: context, 
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  //try creating the user
  try {
    if (passwordController.text == confirmPasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );
      //pop loading icon
      Navigator.pop(context);
    } else {
      //pop loading icon
      Navigator.pop(context);
      showErrorMessage('Passwords do not match');
    }
  } on FirebaseAuthException catch (e) {
    //pop loading icon
    Navigator.pop(context);
    // show error message
    showErrorMessage(e.code);
  }
}


void showErrorMessage(String message) {
  showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const SizedBox(height: 25), 
              //logo
              const Icon(
                Icons.shopping_cart,
                size: 100,
                ),

              const SizedBox(height: 25), 

              //Welcome Text
              const Text(
                'Register Now',
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

              //Confirm password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              //Sign In Button
              MyButton(
                text: "Sign Up",
                onTap: signUserUp,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                  child: const Text(
                    'Login now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}