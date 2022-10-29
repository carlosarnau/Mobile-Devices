// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: Center(
      child: Text(
        'Hola, Flutter',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
  ));
}
