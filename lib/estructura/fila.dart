import 'package:flutter/material.dart';

class Mifila extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Text("Dato 1"),
            Text("Dato 2"),
            Text("Dato 3"),
            Text("Dato 4"),
            Text("Dato 5"),
          ],
        ),
      ),
    );
  }
}