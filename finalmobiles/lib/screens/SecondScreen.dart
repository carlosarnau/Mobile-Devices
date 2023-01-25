import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second Screen',
      color: Colors.grey,
      home: Scaffold(
        appBar: AppBar(title: const Text('Firebase tasks')),
      ),
    );
  }
}
