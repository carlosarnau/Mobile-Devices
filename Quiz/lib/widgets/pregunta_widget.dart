import 'package:flutter/material.dart';
import 'package:quiz/model/pregunta.dart';

class PreguntaWidget extends StatelessWidget {
  final Pregunta pregunta;
  final int indiceMarcada;

  final void Function(int) onRespuesta;
  const PreguntaWidget({
    Key? key,
    required this.pregunta,
    required this.onRespuesta,
    required this.indiceMarcada,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            pregunta.texto,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 30),
          for (int i = 0; i < pregunta.respuestas.length; i++)
            _Respuesta(
              pregunta.respuestas[i],
              onClick: () => onRespuesta(i),
              marcada: i == indiceMarcada,
            )
        ],
      ),
    );
  }
}

class _Respuesta extends StatelessWidget {
  final bool marcada;
  final String respuesta;
  final void Function() onClick;
  const _Respuesta(
    this.respuesta, {
    Key? key,
    required this.onClick,
    this.marcada = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(
        children: [
          Text(
            respuesta,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      onPressed: onClick,
      style: OutlinedButton.styleFrom(
        backgroundColor: marcada ? Colors.blue : Colors.white,
        foregroundColor: marcada ? Colors.white : null,
      ),
    );
  }
}
