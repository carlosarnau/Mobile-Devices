import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ShowNumberScreen(),
        '/edit': (context) => const EditNumberScreen(),
      },
    );
  }
}

class ShowNumberScreen extends StatefulWidget {
  const ShowNumberScreen({Key? key}) : super(key: key);

  @override
  State<ShowNumberScreen> createState() => _ShowNumberScreenState();
}

class _ShowNumberScreenState extends State<ShowNumberScreen> {
  int number = 578;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Show Number")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$number", style: const TextStyle(fontSize: 60)),
            ElevatedButton(
              child: const Text("Edit Number"),
              onPressed: () {
                // 1)
                Navigator.of(context)
                    .pushNamed(
                  '/edit',
                  arguments: number,
                )
                    .then((newNumber) {
                  // 4)
                  if (newNumber != null) {
                    setState(() {
                      number = newNumber as int;
                    });
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class EditNumberScreen extends StatefulWidget {
  const EditNumberScreen({super.key});

  @override
  State<EditNumberScreen> createState() => _EditNumberScreenState();
}

class _EditNumberScreenState extends State<EditNumberScreen> {
  // a) Create a TextEditingController
  TextEditingController controller = TextEditingController();

  @override
  void didChangeDependencies() {
    // 2) Receive data from the calling screen
    final number = ModalRoute.of(context)!.settings.arguments;
    // c) Initialize controller from the arguments passed
    controller.text = "$number";
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // d) Freeing the controller so that we do not "leak" memory
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Screen")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              // b) Install the controller
              controller: controller,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                child: const Text("Save"),
                onPressed: () {
                  // 3) Return the result
                  final editedNumber = int.parse(controller.text);
                  Navigator.of(context).pop(editedNumber);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
