import 'package:flutter/material.dart';
 
 
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatefulWidget {
  const MyApp({super.key});
 
  @override
  State<MyApp> createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PageHome());
  }
}
 


class PageHome extends StatefulWidget {
  const PageHome({
    Key? key,
  }) : super(key: key);
 
  @override
  State<PageHome> createState() => _PageHomeState();
}
 
class _PageHomeState extends State<PageHome> {
  List<LightBulb> listLightbulb = [];
  bool addingLightbulb = false;
  int btnsIDs = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("LightBulb"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: listLightbulb.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: (() {
                      setState(() {
                        listLightbulb.remove(listLightbulb[index]);
                      });
                    }),
                    child: listLightbulb[index],
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  heroTag: "btn_goto_PageAddLightbulb_1",
                  onPressed: (() {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                      builder: (context) => PageAddLightbulb(),
                      
                    ))
                        .then((value) {
                      setState(() {
                        value as String;
                       
                        LightBulb a =
                            LightBulb(name: value, id: btnsIDs++);
                        listLightbulb.add(a);
                      });
                    });
                  }),
                  child: const Icon(Icons.add, size: 48),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: (() {
                    for (final light in listLightbulb) {
                      setState(() {
                        print(light.on.toString());
                        light.on = false;
                        print(light.on.toString());
                      });
                    }
                  }),
                  child: const Icon(Icons.lightbulb_circle, size: 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
class PageAddLightbulb extends StatelessWidget {
  PageAddLightbulb({
    Key? key,
  }) : super(key: key);
  String bulbName = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Add LightBulb"),
        ),
        body: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.grey[200]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Set lightbulb name...",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextField(
                  maxLength: 20,
                  maxLines: 1,
                  onChanged: (value) {
                    bulbName = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    heroTag: "btn_goto_mainPage_1",
                    onPressed: (() {
                      Navigator.of(context).pop(bulbName);
                    }),
                    child: const Icon(Icons.arrow_right, size: 48),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 
 
class LightBulb extends StatefulWidget {
  LightBulb({
    required this.name,
    required this.id,
    Key? key,
  }) : super(key: key);
 
  final String name;
  int id;
  bool on = false;
  void turnOff() {}
  @override
  State<LightBulb> createState() => _LightBulbState();
}
 
class _LightBulbState extends State<LightBulb> {
  void changeState() {
    setState(() {
      widget.on = !widget.on;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FloatingActionButton(
          heroTag: "btn_lightbulb_${widget.id}",
          onPressed: changeState,
          child: widget.on
              ? const Icon(
                  Icons.lightbulb,
                  size: 32,
                )
              : const Icon(
                  Icons.lightbulb_outline,
                  size: 32,
                ),
        ),
        const SizedBox(height: 5),
        Text(
          textAlign: TextAlign.center,
          widget.name,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

