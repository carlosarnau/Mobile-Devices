import 'package:flutter/material.dart';
import 'package:schedule/widgets/screen_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 48, 32, 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const ScreenText(
              "Please choose which time slots you prefer",
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text("Next"),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/choose'),
            )
          ],
        ),
      ),
    );
  }
}
