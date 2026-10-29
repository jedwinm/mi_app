import 'package:flutter/material.dart';
import 'package:mi_app/pantallas/inicio.dart';


void main() {
  runApp(const InicioApp());
}

class InicioApp extends StatelessWidget {
  const InicioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PantallaInicio(),
    );
  }

  
}
