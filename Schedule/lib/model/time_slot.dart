import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedule/config.dart';

class TimeSlot {
  String id;
  DateTime start;

  TimeSlot.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        start = (doc['start'] as Timestamp).toDate();
}

Stream<List<TimeSlot>> dbGetTimeSlots() async* {
  final db = FirebaseFirestore.instance;
  final slotsRef = db.collection("$dbPrefix/slots").orderBy("start");
  await for (final qsnap in slotsRef.snapshots()) {
    yield qsnap.docs.map(TimeSlot.fromFirestore).toList().cast<TimeSlot>();
  }
}
