import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/config.dart';

class Pregunta {
  String id;
  String texto;
  List<String> respuestas;
  int correcta;

  Pregunta.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        texto = doc['texto'],
        respuestas = doc['respuestas'].cast<String>(),
        correcta = doc['correcta'];
}

Stream<List<Pregunta>> dbGetPreguntas() async* {
  final db = FirebaseFirestore.instance;
  final preguntasRef = db.collection('$dbPrefix/preguntas');
  await for (final qsnap in preguntasRef.snapshots()) {
    yield qsnap.docs.map(Pregunta.fromFirestore).toList().cast<Pregunta>();
  }
}
