import 'package:final_2020t_resultats_lliga/widgets/nota.dart';
import 'package:final_2020t_resultats_lliga/widgets/partit_tile.dart';
import 'package:final_2020t_resultats_lliga/widgets/partits_snapshots.dart';
import 'package:flutter/material.dart';

class PartitsScreen extends StatelessWidget {
  const PartitsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultats")),
      body: PartitsSnapshots(builder: (partits) {
        return Column(
          children: [
            const SizedBox(height: 8),
            const Nota("Clica un partit per editar-lo"),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(5.0),
                itemCount: partits.length,
                itemBuilder: (context, index) =>
                    PartitTile(partit: partits[index]),
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/new'),
      ),
    );
  }
}
