import 'package:flutter/material.dart';
import 'package:mi_app/pantallas/calculadora.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Mi primera APP")),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Container(
        width: double.infinity,
        color: Colors.teal.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            const Icon(Icons.monitor_heart, size: 90, color: Colors.teal),

            const SizedBox(height: 20),

            const Text(
              'Calculadora de IMC',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Conoce tu índice de masa corporal"
                "ingresando tu peso y estatura",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PantallaCalculadora(),
                  ),
                );
              },
              child: const Text("Arrancar"),
            ),
          ],
        ),
      ),
    );
  }
}
