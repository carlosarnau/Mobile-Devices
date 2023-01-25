import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LongGridViewScreen(),
    );
  }
}

class LongGridViewScreen extends StatelessWidget {
  const LongGridViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          padding: EdgeInsets.all(30),
          itemCount: 1000,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey,
              child: Center(
                child: Text(
                  "$index",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShortGridScreen extends StatelessWidget {
  const ShortGridScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          for (int i = 0; i < 50; i++)
            Card(
              child: Center(
                child: Text(
                  "${i + 1}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class LongListScreen extends StatelessWidget {
  const LongListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5000,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(onChanged: (v) {}, value: false),
            title: Text("Element $index"),
            subtitle: Text("This is the subtitle"),
            trailing: index % 2 == 0
                ? Icon(Icons.delete)
                : Icon(Icons.delete_forever),
          );
        },
      ),
    );
  }
}

class ShortHorizontalListScreen extends StatelessWidget {
  const ShortHorizontalListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 100; i <= 900; i += 100)
                Container(width: 50, color: Colors.blue[i]),
              for (int i = 100; i <= 900; i += 100)
                Container(width: 50, color: Colors.red[i])
            ],
          ),
        ),
      ),
    );
  }
}

class ShortListScreen extends StatelessWidget {
  const ShortListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        thickness: 15,
        child: ListView(
          children: [
            Container(height: 300, color: Colors.red),
            Container(height: 300, color: Colors.green),
            Container(height: 300, color: Colors.blue),
            Container(height: 300, color: Colors.yellow),
            Container(height: 300, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
