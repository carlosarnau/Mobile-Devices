import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_2020t_resultats_lliga/config.dart';
import 'package:flutter/material.dart';

class AddPartitScreen extends StatefulWidget {
  const AddPartitScreen({super.key});

  @override
  State<AddPartitScreen> createState() => _AddPartitScreenState();
}

class _AddPartitScreenState extends State<AddPartitScreen> {
  final TextEditingController controllerA = TextEditingController();
  final TextEditingController controllerB = TextEditingController();

  @override
  void dispose() {
    controllerA.dispose();
    controllerB.dispose();
    super.dispose();
  }

  void _afegeixEquip() {
    if (controllerA.text.isEmpty || controllerB.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Has d'omplir el nom dels dos equips"),
          backgroundColor: Colors.red[900],
        ),
      );
      return;
    }
    final db = FirebaseFirestore.instance;
    db.collection("$dbPrefix/partits").add({
      'equipA': controllerA.text,
      'equipB': controllerB.text,
      'golsA': 0,
      'golsB': 0,
      'finalitzat': false,
      'started': Timestamp.now(),
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Afegeix Partit")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              autofocus: true,
              controller: controllerA,
              decoration: const InputDecoration(
                label: Text("Equip A"),
              ),
            ),
            TextField(
              controller: controllerB,
              decoration: const InputDecoration(
                label: Text("Equip B"),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _afegeixEquip,
              child: const Text("Afegeix"),
            ),
          ],
        ),
      ),
    );
  }
}
