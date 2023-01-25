import 'package:flutter/material.dart';

class ScreenText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const ScreenText(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(fontSize: 18),
    );
  }
}
