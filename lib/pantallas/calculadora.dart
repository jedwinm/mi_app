import 'package:flutter/material.dart';

class PantallaCalculadora extends StatefulWidget {
  const PantallaCalculadora({super.key});

  @override
  State<PantallaCalculadora> createState() => _PantallaCalculadoraState();
}

class _PantallaCalculadoraState extends State<PantallaCalculadora> {

  // controladores para leer los datos a escribir
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  //variables para guardar el resultado
  double imc = 0;
  String mensaje = "Ingresa tus datos";

  void calcularIMC(){
    double? peso = double.tryParse(pesoController.text.replaceAll(',', '.')); /// 80,5   105,2   =/=  80.5 - 105.2
    double? altura = double.tryParse(alturaController.text.replaceAll(',', '.'));

    if (peso == null || 
        altura == null ||
        peso <= 0 ||
        altura <=0) {

          setState(() {
            imc = 0;
            mensaje ="Ingresa valores válidos";
          });

        return;
    }

    // convertir de centimetros a metros
    altura = altura /100;

    //calculamos el IMC  peso/altura*altura 
    double resultado = peso / (altura * altura);

    //actualizar la pantalla
    setState(() {
      imc = resultado;

      if(imc < 18.5){
        mensaje = 'Bajo peso';
      }else if(imc < 25){
        mensaje ='Peso normal';
      }else if(imc < 30){
        mensaje ='Sobrepeso';
      }else{
        mensaje = 'Obesidad';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        child: Column(

          children: [
            const Text(
              "Ingresa tus datos",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),

            ),
            const SizedBox(height: 25),

            Row(
              // primer fila: PESO
              children: [
                const Icon(Icons.monitor_weight, size: 50),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: pesoController,
                    keyboardType: 
                      const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Peso en Kg.',
                        border: OutlineInputBorder(),
                      ),
                  ) 
                )
              ],              
            ),
            const SizedBox( height: 20),
            
            Row(
              children: [
                const Icon(Icons.height, size: 50),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: alturaController,
                    keyboardType: 
                      const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    decoration: const InputDecoration(
                      labelText: "Estatura en cm",
                      border: OutlineInputBorder(),
                    ),
                  )
                ),
              ],
            ),

            const SizedBox(height: 30,),

            ElevatedButton(
              onPressed: calcularIMC, 
              child: const Text("Calcular IMC"),
              ),

            
            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              color: Colors.lightBlue,

              child: Column(
                children: [
                  const Text(
                    'Tu resultado',
                    style: TextStyle(fontSize: 24),
                  ),

                  const SizedBox(height: 10),
                  
                  Text(
                    imc == 0 ? '--' : imc.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    mensaje,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),

            const SizedBox( height: 20),

            TextButton(
              onPressed: (){ Navigator.pop(context);}, 
              child: const Text("Volver al inicio"),
            ),

            // segunda fila
          ],          
        ),
      ),
    );
  }
}
