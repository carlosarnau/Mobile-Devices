import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              debugPrint("On Tap!!");
            },
            child: Container(
              width: 150,
              height: 250,
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
