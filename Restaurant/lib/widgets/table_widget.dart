import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_2020/model/table.dart';
import 'package:restaurant_2020/widgets/edit_order_dialog.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    Key? key,
    required this.table,
  }) : super(key: key);

  final TableModel table;

  Color _colorFromState(String state) {
    switch (state) {
      case "empty":
        return Colors.grey[100]!;
      case "bill":
        return Colors.blue[200]!;
      case "occupied":
        return Colors.orange[200]!;
      default:
        return Colors.white;
    }
  }

  static const states = ["empty", "occupied", "bill"];
  String _nextState(String state) {
    final pos = states.indexOf(state);
    return states[(pos + 1) % states.length];
  }

  _changeState() {
    final db = FirebaseFirestore.instance;
    final newState = _nextState(table.state);
    final newData = {
      "state": newState,
      "order": newState == "empty" ? "" : table.order,
    };
    db.doc("/exams/restaurant_2022/tables/${table.id}").set(newData);
  }

  _editOrder(BuildContext context) async {
    if (table.state != "occupied") {
      return;
    }
    final db = FirebaseFirestore.instance;
    final order = await showDialog(
      context: context,
      builder: (context) => EditOrderDialog(
        oldOrder: table.order,
      ),
    );
    if (order != null) {
      db.doc("/exams/restaurant_2022/tables/${table.id}").update({
        "order": order,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(table.id, style: const TextStyle(fontSize: 40)),
      ),
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            table.state,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      child: Card(
        color: _colorFromState(table.state),
        child: InkWell(
          onLongPress: _changeState,
          onTap: () => _editOrder(context),
          child: Center(
            child: Text(table.order),
          ),
        ),
      ),
    );
  }
}
