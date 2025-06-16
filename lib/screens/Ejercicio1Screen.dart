import 'package:actividad_autonoma02/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicio 1")),
      body: Cuerpo(context),
      drawer: MiDrawer(),
    );
  }
}

Widget Cuerpo(context) {
  final TextEditingController montoController = TextEditingController();
  final TextEditingController personalizadoController = TextEditingController();

  void mostrarResultado(BuildContext context, double propina, double total) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Resultado"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Propina: ${propina.toStringAsFixed(2)} \$"),
            Text("Total a pagar: ${total.toStringAsFixed(2)} \$"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  void calcularPropina(context, double porcentaje) {
    final monto = double.tryParse(montoController.text);
    if (monto != null && monto > 0) {
      final valorPropina = monto * porcentaje;
      final total = monto + valorPropina;
      mostrarResultado(context, valorPropina, total);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ingrese un monto válido"), backgroundColor: Colors.red),
      );
    }
  }

  void calcularPersonalizada(context) {
    final porcentaje = double.tryParse(personalizadoController.text);
    if (porcentaje != null && porcentaje >= 0) {
      calcularPropina(context, porcentaje / 100);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Porcentaje inválido"), backgroundColor: Colors.red),
      );
    }
  }

  return Padding(
    padding: EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Text("Calculadora de Propinas", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(
            controller: montoController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Monto total", border: OutlineInputBorder()),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => calcularPropina(context, 0.10), child: Text("10%")),
              ElevatedButton(onPressed: () => calcularPropina(context, 0.15), child: Text("15%")),
              ElevatedButton(onPressed: () => calcularPropina(context, 0.20), child: Text("20%")),
            ],
          ),
          SizedBox(height: 16),
          TextField(
            controller: personalizadoController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Porcentaje personalizado", border: OutlineInputBorder()),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => calcularPersonalizada(context),
            child: Text("Calcular personalizada"),
          ),
        ],
      ),
    ),
  );
}
