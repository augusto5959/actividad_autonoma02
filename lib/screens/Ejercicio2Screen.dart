import 'package:actividad_autonoma02/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicio 3")),
      body: Cuerpo(context),
      drawer: MiDrawer(),
    );
  }
}

Widget Cuerpo(context) {
  final TextEditingController capitalController = TextEditingController();
  final TextEditingController tasaController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();

  void mostrarResultado(context, double capital, double interes, double montoFinal) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Resultado"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Capital inicial: ${capital.toStringAsFixed(2)} \$"),
            Text("Interés generado: ${interes.toStringAsFixed(2)} \$"),
            Text("Monto final: ${montoFinal.toStringAsFixed(2)} \$"),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cerrar")),
        ],
      ),
    );
  }

  void calcularInteres(context) {
    final capital = double.tryParse(capitalController.text);
    final tasa = double.tryParse(tasaController.text);
    final tiempo = double.tryParse(tiempoController.text);

    if (capital != null && tasa != null && tiempo != null &&
        capital > 0 && tasa > 0 && tiempo > 0) {
      final interes = capital * tasa * tiempo / 100;
      final montoFinal = capital + interes;
      mostrarResultado(context, capital, interes, montoFinal);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ingrese todos los valores válidos"), backgroundColor: Colors.red),
      );
    }
  }

  void limpiarCampos() {
    capitalController.clear();
    tasaController.clear();
    tiempoController.clear();
  }

  return Padding(
    padding: EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Text("Calculadora de Interés Simple", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(
            controller: capitalController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Capital inicial", border: OutlineInputBorder()),
          ),
          SizedBox(height: 16),
          TextField(
            controller: tasaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Tasa de interés anual (%)", border: OutlineInputBorder()),
          ),
          SizedBox(height: 16),
          TextField(
            controller: tiempoController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Tiempo (años)", border: OutlineInputBorder()),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => calcularInteres(context), child: Text("Calcular")),
              ElevatedButton(onPressed: limpiarCampos, child: Text("Limpiar")),
            ],
          ),
        ],
      ),
    ),
  );
}
