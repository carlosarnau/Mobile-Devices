import 'package:final_2020t_resultats_lliga/firebase_options.dart';
import 'package:final_2020t_resultats_lliga/screens/add_partit_screen.dart';
import 'package:final_2020t_resultats_lliga/screens/partits_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (_) => const PartitsScreen(),
      '/new': (_) => const AddPartitScreen(),
    });
  }
}
