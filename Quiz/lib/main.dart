import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz/firebase_options.dart';
import 'package:quiz/screens/quiz_screen.dart';
import 'package:quiz/screens/results_screen.dart';

/*

Esta solución implementa el examen base y algunas de las funcionalidades extra:
- Cuanta gente está en el test (QuizProvider y variable conectados).
- Cuanta gente ha hecho el test (RespuestasProvider).
- Hall of Fame (_HallOfFame en ResultsScreen).
- Usar modelo y funciones de Streams.

Además, el código es lo más organizado posible, aunque en un examen es difícil 
limpiar el código tanto, así que el ejemplo no es representativo de una solución 
real, sino que tiene esta forma para ser más pedagógico.

-- pauek

*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const QuizApp(),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/quiz',
      routes: {
        '/quiz': (_) => const QuizScreen(),
        '/results': (_) => const ResultsScreen(),
      },
    );
  }
}
