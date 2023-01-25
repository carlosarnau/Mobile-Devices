// Esta clase con un campo es para poder tener un tipo especial
// para el Provider
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/config.dart';

class Quiz {
  int conectados;

  Quiz.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc)
      : conectados = doc['conectados'];
}

Stream<Quiz> dbGetQuiz() async* {
  final db = FirebaseFirestore.instance;
  await for (final doc in db.doc(dbPrefix).snapshots()) {
    yield Quiz.fromFirestore(doc);
  }
}

Future<void> dbQuizConnect() async {
  final db = FirebaseFirestore.instance;
  await db.doc(dbPrefix).update({'conectados': FieldValue.increment(1)});
}

Future<void> dbQuizDisconnect() async {
  final db = FirebaseFirestore.instance;
  await db.doc(dbPrefix).update({'conectados': FieldValue.increment(-1)});
}
