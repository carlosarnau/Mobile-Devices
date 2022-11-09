import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 150,
            height: 300,
            color: Colors.blue[200],
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 50),
            child: const Text("I'm the child of the container"),
          ),
        ),
      ),
    );
  }
}
