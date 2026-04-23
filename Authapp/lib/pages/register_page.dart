import 'package:authenticationapp/components/my_sign_in_out_button.dart';
import 'package:authenticationapp/components/my_text_field.dart';
import 'package:authenticationapp/components/square_tile.dart';
import 'package:authenticationapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController confirmPassController = TextEditingController();

  final String hintUser = 'Username';

  final String hintPass = 'Password';

  final String hintConfirmPass = 'Confirm Password';

  String firebaseErrorMessage = '';

  //Sign in method
  void onSignUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    String? message;
    //creating the user
    try {
      if (passController.text == confirmPassController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        if (mounted) {
          Navigator.pop(context);
          return;
        }
      } else {
        if (mounted) {
          setState(() {
            firebaseErrorMessage = 'Passwords doesn\'t match';
          });
          Navigator.pop(context);
        }
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        message = 'Invalid Credential, Please try again';
      } else if (e.code == 'user-not-found') {
        message = 'No User found for that email';
      } else if (e.code == 'wrong-password') {
        message = 'You have typed the wrong password';
      } else if (e.code == 'email-already-in-use') {
        message = 'User already exists, forgot password?';
      } else {
        message = 'Error: ${e.code}';
      }
    }
    if (mounted) {
      setState(() {
        firebaseErrorMessage = message!;
      });
      Navigator.pop(context);
    }
  }

  //on google logo pressed
  void onGoogleLogoPressed() {
    AuthService().signInUsingGoogle();
  }

  //on apple logo pressed
  void onAppleLogoPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Size
                const SizedBox(height: 50),

                //Logo
                const Icon(Icons.lock, size: 50),

                //space between
                const SizedBox(height: 25),
                //Welcome Back, You've been missed!
                Text(
                  'Let\'s create am account for you',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                //space between
                const SizedBox(height: 25),

                //username textfield
                MyTextField(
                  controller: emailController,
                  hint: hintUser,
                  obscureText: false,
                ),

                //space between
                const SizedBox(height: 10),

                //password textfield
                MyTextField(
                  controller: passController,
                  hint: hintPass,
                  obscureText: true,
                ),

                //space between
                const SizedBox(height: 10),

                //confirm password
                MyTextField(
                  controller: confirmPassController,
                  hint: hintConfirmPass,
                  obscureText: true,
                ),

                if (firebaseErrorMessage.isNotEmpty)
                  Column(
                    children: [
                      SizedBox(height: 7),
                      Text(
                        firebaseErrorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                //space between
                SizedBox(height: 10),
                //forgot password?
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text('Forgot Password?'),
                    ),
                  ],
                ),

                //space between
                const SizedBox(height: 25),

                //sign in button
                MySignInOutButton(onTap: onSignUserUp, text: 'Sign Up'),

                //Space Between
                SizedBox(height: 50),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Continue With',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                //google, and apple signing button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    SquareTile(
                      imagePath: 'lib/images/googlelogo.png',
                      onTap: onGoogleLogoPressed,
                    ),
                    SizedBox(width: 25),
                    //apple button
                    SquareTile(
                      imagePath: 'lib/images/applelogo.png',
                      onTap: onAppleLogoPressed,
                    ),
                  ],
                ),

                //space between
                SizedBox(height: 50),
                //not a member, register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login  now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
