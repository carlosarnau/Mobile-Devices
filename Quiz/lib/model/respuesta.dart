import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/config.dart';

class Respuesta {
  String id, nombre;
  num nota;
  DateTime timestamp;

  Respuesta.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nombre = doc['nombre'],
        nota = doc['nota'],
        timestamp = (doc['timestamp'] as Timestamp).toDate();
}

Stream<List<Respuesta>> dbGetRespuestas() async* {
  final db = FirebaseFirestore.instance;
  final preguntasRef =
      db.collection('$dbPrefix/resultados').orderBy("nota", descending: true);
  await for (final qsnap in preguntasRef.snapshots()) {
    yield qsnap.docs.map(Respuesta.fromFirestore).toList().cast<Respuesta>();
  }
}
