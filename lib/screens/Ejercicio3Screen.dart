import 'package:actividad_autonoma02/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

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
  final TextEditingController ahorroController = TextEditingController();
  final TextEditingController mesesController = TextEditingController();

  void mostrarResultado(context, double ahorroMensual, int meses) {
    final total = ahorroMensual * meses;
    List<Widget> detalle = [];

    for (int i = 1; i <= meses; i++) {
      detalle.add(Text("Mes $i: ${(ahorroMensual * i).toStringAsFixed(2)} \$"));
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Resultado"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Total ahorrado: ${total.toStringAsFixed(2)} \$"),
              SizedBox(height: 10),
              Text("Detalle por mes:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...detalle,
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cerrar")),
        ],
      ),
    );
  }

  void calcularAhorro(context) {
    final ahorro = double.tryParse(ahorroController.text);
    final meses = int.tryParse(mesesController.text);

    if (ahorro != null && meses != null && ahorro > 0 && meses > 0) {
      mostrarResultado(context, ahorro, meses);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ingrese valores válidos"), backgroundColor: Colors.red),
      );
    }
  }

  void limpiarCampos() {
    ahorroController.clear();
    mesesController.clear();
  }

  return Padding(
    padding: EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Text("Simulador de Ahorro Mensual", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(
            controller: ahorroController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Ahorro mensual", border: OutlineInputBorder()),
          ),
          SizedBox(height: 16),
          TextField(
            controller: mesesController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Cantidad de meses", border: OutlineInputBorder()),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => calcularAhorro(context), child: Text("Calcular")),
              ElevatedButton(onPressed: limpiarCampos, child: Text("Limpiar")),
            ],
          ),
        ],
      ),
    ),
  );
}
