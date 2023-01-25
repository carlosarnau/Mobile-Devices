import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_2020t_resultats_lliga/config.dart';

class Partit {
  String id;
  String equipA, equipB;
  int golsA, golsB;
  bool finalitzat;
  DateTime started;

  Partit.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        equipA = doc['equipA'],
        equipB = doc['equipB'],
        golsA = doc['golsA'],
        golsB = doc['golsB'],
        finalitzat = doc['finalitzat'],
        started = (doc['started'] as Timestamp).toDate();

  bool get notFinalitzat => !finalitzat;

  get _ref => FirebaseFirestore.instance.doc("$dbPrefix/partits/$id");

  incrA(int n) {
    if (golsA + n >= 0) {
      _ref.update({'golsA': golsA + n});
    }
  }

  incrB(int n) {
    if (golsB + n >= 0) {
      _ref.update({'golsB': golsB + n});
    }
  }

  finalitza() => _ref.update({'finalitzat': true});
}

Stream<List<Partit>> dbGetPartits() async* {
  final db = FirebaseFirestore.instance;
  final partitsRef = db.collection("$dbPrefix/partits").orderBy("started");
  await for (final qsnap in partitsRef.snapshots()) {
    yield qsnap.docs.map(Partit.fromFirestore).toList().cast<Partit>();
  }
}
