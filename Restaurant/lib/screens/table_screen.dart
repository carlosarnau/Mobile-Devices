import 'package:flutter/material.dart';
import 'package:restaurant_2020/widgets/help_note.dart';
import 'package:restaurant_2020/widgets/table_widget.dart';
import 'package:restaurant_2020/widgets/table_list_snapshots.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableListSnapshots(
        builder: (tables) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: tables.length,
                  itemBuilder: (context, index) =>
                      TableWidget(table: tables[index]),
                ),
              ),
              const HelpNote(),
            ],
          );
        },
      ),
    );
  }
}
