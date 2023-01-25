import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule/config.dart';
import 'package:schedule/widgets/screen_text.dart';
import 'package:schedule/widgets/timestamp_text.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  _save(Map<String, DateTime> selection) async {
    final db = FirebaseFirestore.instance;
    await db.collection("$dbPrefix/users").add({
      'selection': selection.keys.toList(),
      'date': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final selected =
        ModalRoute.of(context)!.settings.arguments as Map<String, DateTime>;
    return Scaffold(
      appBar: AppBar(title: const Text("Confirm you Choices")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 48, 32, 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ScreenText("Has escogido:", textAlign: TextAlign.left),
            const SizedBox(height: 8),
            for (final date in selected.values) TimestampText(date),
            const Spacer(),
            ElevatedButton(
              child: const Text("Volver"),
              onPressed: () => Navigator.of(context).pushReplacementNamed(
                '/choose',
                arguments: selected,
              ),
            ),
            ElevatedButton(
              child: const Text("Guardar"),
              onPressed: () async {
                await _save(selected);
                SystemNavigator.pop(); // salir de la app
              },
            ),
          ],
        ),
      ),
    );
  }
}
