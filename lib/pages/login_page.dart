import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/button.dart';
import 'package:social_media_app/components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  //Sign in method
  void signIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
      //pop loadin circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //display error message
      displayMessage(e.code);
    }
  }

  //display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                const Icon(
                  Icons.abc,
                  size: 150,
                ),

                //welcome back message
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 25),
                //email textfield
                MyTextField(
                  controller: emailTextController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                //password
                MyTextField(
                  controller: passwordTextController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                //sign in button
                MyButton(
                  text: 'Log In',
                  onTap: signIn,
                ),
                const SizedBox(height: 25),
                //go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a Member?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign Up now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    )
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
