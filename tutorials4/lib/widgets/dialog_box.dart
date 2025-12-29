import 'package:flutter/material.dart';
import 'package:tutorials4/widgets/alert_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onRemove;
  final errorMessage;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onRemove,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 150,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Add a text Here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save button
                AlertButtons(
                  title: 'Cancel',
                  onPressed: () {
                    onRemove();
                  },
                ),
                const SizedBox(width: 5.0),
                //cancel button
                AlertButtons(
                  title: 'Save',
                  onPressed: () {
                    onSave();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
