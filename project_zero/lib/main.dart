// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Text(
          'Hello, Flutter',
        ),
      ),
    );
  }
}

void main() {
  runApp(Screen());
}
