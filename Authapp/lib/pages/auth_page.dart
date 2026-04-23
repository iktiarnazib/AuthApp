import 'package:authenticationapp/pages/home_page.dart';
import 'package:authenticationapp/pages/login_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //user has data
          if (snapshot.hasData) {
            return HomePage();
          }
          //user doesn't have data
          else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
