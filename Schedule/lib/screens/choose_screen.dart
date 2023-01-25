import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/model/time_slot.dart';
import 'package:schedule/widgets/screen_text.dart';
import 'package:schedule/widgets/timeslots_provider.dart';
import 'package:schedule/widgets/timestamp_text.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TimeSlotsProvider(
      child: _Screen(),
    );
  }
}

class _Screen extends StatefulWidget {
  const _Screen({Key? key}) : super(key: key);

  @override
  State<_Screen> createState() => _ScreenState();
}

class _ScreenState extends State<_Screen> {
  Map<String, DateTime> selected = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null && route.settings.arguments != null) {
      selected = route.settings.arguments as Map<String, DateTime>;
    }
  }

  _toggle(TimeSlot slot) {
    setState(() {
      if (selected.containsKey(slot.id)) {
        selected.remove(slot.id);
      } else {
        selected[slot.id] = slot.start;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final timeslots = context.watch<List<TimeSlot>>();
    return Scaffold(
      appBar: AppBar(title: const Text("Choose slots")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ScreenText("Select which timeslots are convenient for you"),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: timeslots.length,
                itemBuilder: (context, index) {
                  final slot = timeslots[index];
                  return _TimeslotWidget(
                    selected: selected.containsKey(slot.id),
                    start: slot.start,
                    onToggle: () => _toggle(slot),
                  );
                },
              ),
            ),
            ElevatedButton(
              child: const Text("Confirm"),
              onPressed: () => Navigator.of(context).pushReplacementNamed(
                '/confirm',
                arguments: selected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeslotWidget extends StatelessWidget {
  const _TimeslotWidget({
    Key? key,
    required this.selected,
    required this.start,
    required this.onToggle,
  }) : super(key: key);

  final bool selected;
  final DateTime start;
  final void Function() onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 3,
            style: selected ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: ListTile(
          selected: selected,
          leading: Checkbox(
            value: selected,
            onChanged: (_) => onToggle(),
          ),
          title: TimestampText(start),
          onTap: onToggle,
        ),
      ),
    );
  }
}
