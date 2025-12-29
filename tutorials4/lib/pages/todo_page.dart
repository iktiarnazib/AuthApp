import 'package:flutter/material.dart';
import 'package:tutorials4/widgets/dialog_box.dart';
import 'package:tutorials4/widgets/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

TextEditingController _controller = TextEditingController();
String _errorMessage = '';

class _TodoPageState extends State<TodoPage> {
  //List of todo tasks
  List<List<dynamic>> toDoList = [
    ["Learn MM", false],
    ["Fight with Pukkie", false],
    ["Finish 9 Hour Tutorial", false],
  ];

  //onCheckboxChanged
  void onCheckboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = value ?? true;
    });
  }

  void onSave() {
    setState(() {
      if (_controller.text.trim().isNotEmpty) {
        toDoList.add([_controller.text, false]);
        _errorMessage = '';
        Navigator.pop(context);
      } else if (_controller.text.trim().isEmpty) {
        _errorMessage = 'Please add a text';
      }
    });
  }

  void _onRemove() {
    Navigator.pop(context);
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          errorMessage: _errorMessage,
          controller: _controller,
          onSave: () {
            onSave();
          },
          onRemove: _onRemove,
        );
      },
    );
  }

  void deleteTask(int Index) {
    setState(() {
      toDoList.removeAt(Index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: Text('T O D O A P P'),
        backgroundColor: Colors.amber[300],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) {
                onCheckboxChanged(value, index);
              },
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton.extended(
          elevation: 10,
          backgroundColor: Colors.amber[500],
          onPressed: () {
            createNewTask();
            _controller.clear();
          },
          icon: Icon(Icons.add),
          label: Text('Add Task'),
        ),
      ),
    );
  }
}
