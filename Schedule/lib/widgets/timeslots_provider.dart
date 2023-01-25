import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/model/time_slot.dart';

class TimeSlotsProvider extends StatelessWidget {
  final Widget child;
  const TimeSlotsProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TimeSlot>>(
      stream: dbGetTimeSlots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Provider<List<TimeSlot>>.value(
          value: snapshot.data!,
          child: child,
        );
      },
    );
  }
}
