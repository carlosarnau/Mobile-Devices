import 'package:final_2020t_resultats_lliga/model/partit.dart';
import 'package:final_2020t_resultats_lliga/widgets/nota.dart';
import 'package:flutter/material.dart';

class PartitTile extends StatefulWidget {
  final Partit partit;
  const PartitTile({super.key, required this.partit});

  @override
  State<PartitTile> createState() => _PartitTileState();
}

class _PartitTileState extends State<PartitTile> {
  bool editing = false;

  _toggleEditing() {
    if (widget.partit.notFinalitzat) {
      setState(() => editing = !editing);
    }
  }

  _finalitza() async {
    final confirmat = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmació"),
          content: Text(
            "Estàs segur que vols finalitzar el partit "
            "'${widget.partit.equipA} - ${widget.partit.equipB}'?",
          ),
          actions: [
            TextButton(
              child: const Text("Cancel·la"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text("Finalitza"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
    if (confirmat) {
      setState(() => editing = false);
      widget.partit.finalitza();
    }
  }

  @override
  Widget build(BuildContext context) {
    final finalitzat = widget.partit.finalitzat;
    return Card(
      color: widget.partit.finalitzat ? Colors.green[100] : Colors.yellow[50],
      child: InkWell(
        onTap: finalitzat ? null : _toggleEditing,
        onLongPress: finalitzat ? null : _finalitza,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 18.0,
          ),
          child: Column(
            children: [
              _Resultat(widget.partit),
              if (editing) ...[
                _Editor(widget.partit),
                const Nota("Per finalitzar fes long-click"),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _Resultat extends StatelessWidget {
  final Partit partit;
  const _Resultat(this.partit);

  @override
  Widget build(BuildContext context) {
    const styleGols = TextStyle(fontSize: 30);
    const styleEquips = TextStyle(fontSize: 20, color: Colors.grey);
    const space = SizedBox(width: 12);

    return Row(
      children: [
        Text("${partit.golsA}", style: styleGols),
        space,
        Expanded(
          flex: 5,
          child: Text(
            partit.equipA,
            style: styleEquips,
            textAlign: TextAlign.right,
          ),
        ),
        space,
        const SizedBox(
          width: 15,
          child: Divider(
            thickness: 2,
          ),
        ),
        space,
        Expanded(
          flex: 5,
          child: Text(partit.equipB, style: styleEquips),
        ),
        space,
        Text("${partit.golsB}", style: styleGols),
      ],
    );
  }
}

class _Editor extends StatelessWidget {
  final Partit partit;
  const _Editor(this.partit);

  _boto(IconData icon, void Function() fn) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
        ),
        onPressed: fn,
        child: Icon(icon, size: 24),
      );

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(width: 5);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Row(
        children: [
          _boto(Icons.add, () => partit.incrA(1)),
          space,
          _boto(Icons.remove, () => partit.incrA(-1)),
          const Spacer(),
          _boto(Icons.remove, () => partit.incrB(-1)),
          space,
          _boto(Icons.add, () => partit.incrB(1)),
        ],
      ),
    );
  }
}
