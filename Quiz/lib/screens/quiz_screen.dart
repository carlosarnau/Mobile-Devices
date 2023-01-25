import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/quiz.dart';
import 'package:quiz/model/pregunta.dart';
import 'package:quiz/widgets/pregunta_widget.dart';
import 'package:quiz/widgets/preguntas_provider.dart';
import 'package:quiz/widgets/quiz_provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizProvider(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz"),
          actions: const [
            _Conectados(),
          ],
        ),
        body: const PreguntasProvider(
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  int indiceActual = 0;
  int respuesta = -1;
  int totalCorrectas = 0;

  _siguiente() {
    final preguntas = context.read<List<Pregunta>>();
    final preguntaActual = preguntas[indiceActual];
    if (respuesta == preguntaActual.correcta) {
      totalCorrectas++;
    }
    if (indiceActual + 1 >= preguntas.length) {
      Navigator.of(context).pushReplacementNamed('/results', arguments: {
        'correctas': totalCorrectas,
        'total': preguntas.length,
      });
    } else {
      indiceActual++;
      respuesta = -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final preguntas = context.read<List<Pregunta>>();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Title(indiceActual + 1),
          PreguntaWidget(
            pregunta: preguntas[indiceActual],
            onRespuesta: (int i) {
              setState(() => respuesta = i);
            },
            indiceMarcada: respuesta,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: Row(
                  children: const [
                    Text("Siguiente"),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward),
                  ],
                ),
                onPressed: respuesta != -1 ? () => setState(_siguiente) : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(
    this.indicePregunta, {
    Key? key,
  }) : super(key: key);

  final int indicePregunta;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Pregunta $indicePregunta",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.black26,
      ),
    );
  }
}

class _Conectados extends StatelessWidget {
  const _Conectados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<Quiz>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Icon(Icons.group),
          const SizedBox(width: 10),
          Text(quiz.conectados.toString()),
        ],
      ),
    );
  }
}
