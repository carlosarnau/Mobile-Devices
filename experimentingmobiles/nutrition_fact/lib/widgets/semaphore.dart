import 'package:flutter/material.dart';

class Semaphore extends StatelessWidget {
  const Semaphore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 15);
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _SemaphoreLight(color: Colors.red),
          separator,
          _SemaphoreLight(color: Colors.amber),
          separator,
          _SemaphoreLight(color: Colors.green),
        ],
      ),
    );
  }
}

class _SemaphoreLight extends StatelessWidget {
  final Color color;
  const _SemaphoreLight({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
