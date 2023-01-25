import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/config.dart';
import 'package:quiz/model/respuesta.dart';
import 'package:quiz/widgets/respuestas_provider.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RespuestasProvider(
      child: SafeArea(
        child: Scaffold(
          body: ResultsScreenBody(),
        ),
      ),
    );
  }
}

class ResultsScreenBody extends StatefulWidget {
  const ResultsScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultsScreenBody> createState() => _ResultsScreenBodyState();
}

class _ResultsScreenBodyState extends State<ResultsScreenBody> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int correctas = args['correctas'];
    final int total = args['total'];
    final double nota = correctas.toDouble() / total.toDouble() * 10.0;

    final respuestas = context.read<List<Respuesta>>();

    _reset() {
      Navigator.of(context).pushReplacementNamed('/quiz');
    }

    _save() {
      final db = FirebaseFirestore.instance;
      db.collection("$dbPrefix/resultados").add({
        'nombre': controller.text,
        'nota': nota,
        'timestamp': Timestamp.now(),
      });
      _reset();
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.group, color: Colors.grey),
              const SizedBox(width: 6),
              Text("${respuestas.length} personas han realizado el test"),
            ],
          ),
          const Spacer(),
          _Resultado(nota: nota, total: total, correctas: correctas),
          const Spacer(),
          _HallOfFame(respuestas: respuestas),
          const Spacer(),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              label: Text("Escribe tu nombre"),
            ),
          ),
          ElevatedButton(
            child: const Text("Guardar"),
            onPressed: _save,
          ),
          const Spacer(),
          _Reiniciar(onPressed: _reset),
        ],
      ),
    );
  }
}

class _HallOfFame extends StatelessWidget {
  const _HallOfFame({
    Key? key,
    required this.respuestas,
  }) : super(key: key);

  final List<Respuesta> respuestas;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Hall of Fame",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Divider(),
        Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: ListView.builder(
            itemCount: respuestas.length,
            itemBuilder: (_, index) {
              final resp = respuestas[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(resp.nombre),
                  Text(resp.nota.toInt().toString()),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Reiniciar extends StatelessWidget {
  final void Function() onPressed;
  const _Reiniciar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.refresh),
          SizedBox(width: 12),
          Text("Reiniciar"),
        ],
      ),
      onPressed: onPressed,
    );
  }
}

class _Resultado extends StatelessWidget {
  const _Resultado({
    Key? key,
    required this.nota,
    required this.total,
    required this.correctas,
  }) : super(key: key);

  final double nota;
  final int total, correctas;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$nota",
          style: const TextStyle(fontSize: 80),
          textAlign: TextAlign.center,
        ),
        Text(
          "$correctas de $total",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
