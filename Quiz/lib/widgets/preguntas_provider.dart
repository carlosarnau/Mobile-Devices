import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/pregunta.dart';

class PreguntasProvider extends StatelessWidget {
  final Widget child;
  const PreguntasProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Pregunta>>(
      stream: dbGetPreguntas(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Provider.value(
          value: snapshot.data!,
          child: child,
        );
      },
    );
  }
}
