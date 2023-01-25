import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schedule/firebase_options.dart';
import 'package:schedule/screens/choose_screen.dart';
import 'package:schedule/screens/confirm_screen.dart';
import 'package:schedule/screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const StartScreen(),
        '/choose': (_) => const ChooseScreen(),
        '/confirm': (_) => const ConfirmScreen(),
      },
    );
  }
}
