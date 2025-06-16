import 'package:actividad_autonoma02/screens/Ejercicio1Screen.dart';
import 'package:actividad_autonoma02/screens/Ejercicio2Screen.dart';
import 'package:actividad_autonoma02/screens/Ejercicio3Screen.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Menú',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Ejercicio 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ejercicio1()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Ejercicio 2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ejercicio2()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Ejercicio 3'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ejercicio3()),
                );
              },
            ),
          ],
        ),
      );
  }
}