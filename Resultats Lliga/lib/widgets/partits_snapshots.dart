import 'package:final_2020t_resultats_lliga/model/partit.dart';
import 'package:flutter/material.dart';

class PartitsSnapshots extends StatelessWidget {
  final Widget Function(List<Partit>) builder;
  const PartitsSnapshots({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: dbGetPartits(),
        builder: (context, AsyncSnapshot<List<Partit>> snapshot) {
          if (snapshot.hasError) {
            return ErrorWidget(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return builder(snapshot.data!);
        });
  }
}
