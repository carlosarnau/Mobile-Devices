import 'package:flutter/material.dart';

class HelpNote extends StatelessWidget {
  const HelpNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[400],
      padding: const EdgeInsets.all(12.0),
      child: const Text(
        "Long-press to change table state\n"
        "Press to edit order while table occupied",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
