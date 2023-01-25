import 'package:flutter/material.dart';
import 'package:restaurant_2020/model/table.dart';

class TableListSnapshots extends StatelessWidget {
  final Widget Function(List<TableModel>) builder;
  const TableListSnapshots({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dbGetTables(),
      builder: (context, AsyncSnapshot<List<TableModel>> snapshot) {
        if (snapshot.hasError) {
          if (snapshot.error is Error) {
            debugPrint((snapshot.error as Error).stackTrace.toString());
          }
          return ErrorWidget(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final items = snapshot.data!;
        return builder(items);
      },
    );
  }
}
