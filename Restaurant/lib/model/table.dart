import 'package:cloud_firestore/cloud_firestore.dart';

class TableModel {
  String id, state;
  String order;
  TableModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        state = doc['state'],
        order = doc['order'];
}

Stream<List<TableModel>> dbGetTables() async* {
  final db = FirebaseFirestore.instance;
  final tables = db.collection("/exams/restaurant_2022/tables");
  await for (final qsnap in tables.snapshots()) {
    yield qsnap.docs.map(TableModel.fromFirestore).toList().cast<TableModel>();
  }
}
