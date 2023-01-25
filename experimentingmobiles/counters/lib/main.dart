import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class Counter {
  final int id;
  int count = 10;
  Counter(this.id);
}

class _CounterScreenState extends State<CounterScreen> {
  int lastID = 0;
  List<Counter> counters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: ListView.builder(
        itemCount: counters.length,
        itemBuilder: (context, index) {
          final counter = counters[index];
          return ListTile(
            title: Text("Counter ${counter.id}"),
            trailing: Text("${counter.count}"),
            onTap: () {
              setState(() {
                counter.count--;
                if (counter.count <= 0) {
                  counters.remove(counter);
                }
              });
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counters.add(Counter(++lastID));
            debugPrint(counters.toString());
          });
        },
      ),
    );
  }
}
