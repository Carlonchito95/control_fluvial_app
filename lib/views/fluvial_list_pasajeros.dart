import 'package:flutter/material.dart';

class FluvialListPasajeros extends StatefulWidget {
  const FluvialListPasajeros({super.key});

  @override
  State<FluvialListPasajeros> createState() => _FluvialListPasajerosState();
}

class _FluvialListPasajerosState extends State<FluvialListPasajeros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de pasajeros',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
