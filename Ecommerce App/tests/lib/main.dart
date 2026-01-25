import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<List<dynamic>> todoList = [
    ['Doing homework', false],
    ['Finish Ecommerce app', false],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
            ...[ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(todoList[index][0]));
              },
            ),]
          
        ),
      ),
    );
  }
}
