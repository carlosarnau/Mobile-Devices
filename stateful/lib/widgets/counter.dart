import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final double size;
  const Counter({super.key, required this.size});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() => count--);
          },
          child: Icon(Icons.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "$count",
            style: TextStyle(fontSize: widget.size),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() => count++);
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
