import 'package:authenticationapp/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final String hintUser = 'Username';
  final String hintPass = 'Password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
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
              //sign in button
              const SizedBox(height: 25),
              //or continue with

              //google, and apple signing button

              //not a member, register now
            ],
          ),
        ),
      ),
    );
  }
}
