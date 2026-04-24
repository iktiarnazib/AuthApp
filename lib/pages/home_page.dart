import 'package:authenticationapp/pages/update_username.dart';
import 'package:authenticationapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //update username controller
  TextEditingController updateUsernameTextControllder = TextEditingController();

  //current user
  final user = FirebaseAuth.instance.currentUser!;

  //logout
  void onLogOutPressed() {
    FirebaseAuth.instance.signOut();
  }

  //update username
  onUpdateUsernamePressed(String newUserName) async {
    await AuthService().updateUserName(newUserName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: onLogOutPressed,
            icon: Icon(Icons.exit_to_app, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage(
                '${FirebaseAuth.instance.currentUser!.photoURL ?? Icon(Icons.account_circle, color: Colors.purple)}',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Logging In: ${FirebaseAuth.instance.currentUser!.displayName ?? 'User'}',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            //space between
            SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UpdateUsername();
                    },
                  ),
                );
                setState(() {});
              },
              child: Text('Update username'),
            ),
          ],
        ),
      ),
    );
  }
}
