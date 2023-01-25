import 'package:finalmobiles/screens/FirstScreen.dart';
import 'package:finalmobiles/screens/SecondScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:finalmobiles/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const AppScreens(),
  );
}

class AppScreens extends StatelessWidget {
  const AppScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primaryColor: Colors.blue), routes: {
      '/': (context) => FirstScreen(),
      '/two': (context) => SecondScreen(),
    });
  }
}

// Needed to let firebase run
// flutter pub add firebase_core
// dart pub global activate flutterfire_cli
// flutterfire configure (només funciona al nu>)