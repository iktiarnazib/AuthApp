import 'package:authenticationapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateUsername extends StatefulWidget {
  const UpdateUsername({super.key});

  @override
  State<UpdateUsername> createState() => _UpdateUsernameState();
}

class _UpdateUsernameState extends State<UpdateUsername> {
  TextEditingController updateUsernameController = TextEditingController();
  String error = '';

  onUpdateUsernamePressed(String newUsername) async {
    try {
      await AuthService().updateUserName(newUsername);
      await FirebaseAuth.instance.currentUser!.reload();
      if (mounted) {
        Navigator.pop(context);
      }
      setState(() {
        error = '';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Update username',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: updateUsernameController,
              decoration: InputDecoration(
                hintText: 'New Username',
                hintStyle: TextStyle(color: Colors.grey[300]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          if (error.isNotEmpty) Text(error),
          FilledButton(
            onPressed: () {
              onUpdateUsernamePressed(updateUsernameController.text);
            },
            child: Text('Update username'),
          ),
        ],
      ),
    );
  }
}
