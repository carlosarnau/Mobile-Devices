import 'package:flutter/material.dart';

class Nota extends StatelessWidget {
  final String text;
  const Nota(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black26,
        fontStyle: FontStyle.italic,
        fontSize: 12,
      ),
    );
  }
}
