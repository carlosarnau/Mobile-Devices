import 'package:flutter/material.dart';
import 'package:nutrition_fact/widgets/semaphore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              NutritionStat(stat: "Calories", value: 247, units: "kcal"),
              SizedBox(width: 10),
              NutritionStat(stat: "Carbo", value: 33.5, units: "g"),
              SizedBox(width: 10),
              NutritionStat(stat: "Protein", value: 6.8, units: "g"),
              SizedBox(width: 10),
              NutritionStat(stat: "Fat", value: 9.6, units: "g"),
            ],
          ),
        ),
      ),
    );
  }
}

class NutritionStat extends StatelessWidget {
  final num value;
  final String stat, units;
  const NutritionStat({
    Key? key,
    required this.value,
    required this.stat,
    required this.units,
  }) : super(key: key);

  static const double width = 70, height = 120;
  static const double padding = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.pink[300],
        borderRadius: BorderRadius.all(Radius.circular(width / 2)),
      ),
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Container(
            width: width - padding * 2,
            height: width - padding * 2,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "$value",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          Text(stat),
          Text(units, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
