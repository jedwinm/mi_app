import 'package:flutter/material.dart';
import 'package:mi_app/estructura/fila.dart';

class MiColumna extends StatelessWidget {
  const new({super.key, required Mifila child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("texto 1"),
          Text("texto 2"),
          Text("texto 3"),
          Text("hola sofi"),
        ],
      ),
    );
  }
}
