import 'package:authenticationapp/components/my_sign_in_button.dart';
import 'package:authenticationapp/components/my_text_field.dart';
import 'package:authenticationapp/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final String hintUser = 'Username';
  final String hintPass = 'Password';

  void onSignInUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    );
  }

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
                const Icon(Icons.lock, size: 100),

                //space between
                const SizedBox(height: 50),
                //Welcome Back, You've been missed!
                Text(
                  "Welcome Back, You've been missed!",
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
                const SizedBox(height: 10),
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
                MySignInButton(onTap: onSignInUser),

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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    SquareTile(imagePath: 'lib/images/googlelogo.png'),
                    SizedBox(width: 25),
                    //apple button
                    SquareTile(imagePath: 'lib/images/applelogo.png'),
                  ],
                ),

                //space between
                SizedBox(height: 50),
                //not a member, register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
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
