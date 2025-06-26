import 'dart:convert';

import 'package:app_fluvial/services/global_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FluvialPanelViajes extends StatefulWidget {
  const FluvialPanelViajes({super.key});

  @override
  State<FluvialPanelViajes> createState() => _FluvialPanelViajesState();
}

class _FluvialPanelViajesState extends State<FluvialPanelViajes> {
  int? viajes;

  @override
  void initState() {
    super.initState();
    _numViajesRegistrados();
  }

  List<Map<String, dynamic>> viajeruta = [
    {
      'id_ruta': 1,
      'salida': 'Iquitos',
      'llegada': 'Santa Rosa',
      'num_pasajeros': '80'
    },
    {
      'id_ruta': 2,
      'salida': 'Santa Rosa',
      'llegada': 'Iquitos',
      'num_pasajeros': '90'
    },
    {
      'id_ruta': 3,
      'salida': 'Iquitos',
      'llegada': 'Caballococha',
      'num_pasajeros': '50'
    },
    {
      'id_ruta': 3,
      'salida': 'Iquitos',
      'llegada': 'Caballococha',
      'num_pasajeros': '50'
    },
    {
      'id_ruta': 3,
      'salida': 'Iquitos',
      'llegada': 'Caballococha',
      'num_pasajeros': '50'
    },
    {
      'id_ruta': 3,
      'salida': 'Iquitos',
      'llegada': 'Caballococha',
      'num_pasajeros': '50'
    },
    {
      'id_ruta': 3,
      'salida': 'Iquitos',
      'llegada': 'Caballococha',
      'num_pasajeros': '50'
    },
    {
      'id_ruta': 3,
      'salida': 'Iquitos',
      'llegada': 'Caballococha',
      'num_pasajeros': '50'
    },
    {
      'id_ruta': 3,
      'salida': 'Iquitos',
      'llegada': 'Caballococha',
      'num_pasajeros': '50'
    },
  ];

  final url = "${ApiGlobal.baseUrl}/get_list_viajes";

  Future<void> _numViajesRegistrados() async {
    final response = await http.post(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          viajes = data.length;
        });
      } else {
        // manejar error de respuesta
        print('Error: código de estado ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener los viajes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text(
          'Panel de viajes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Card(
            color: const Color(0xff848490),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Total de viajes registrados: ${viajes ?? 0}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...viajeruta.asMap().entries.map((entry) {
            int index = entry.key;
            final ruta = entry.value;

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.directions_boat, size: 40),
                    const SizedBox(height: 20),
                    Text(
                      " ${ruta['salida']} → ${ruta['llegada']}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text("ID Ruta: ${ruta['id_ruta']}"),
                    const SizedBox(height: 5),
                    Text("Pasajeros: ${ruta['num_pasajeros']}"),
                    const SizedBox(height: 20),
                    index == 0
                        ? Center(
                            child: SizedBox(
                              width: 250,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff013974),
                                ),
                                onPressed: () {
                                  print(
                                      "Añadir pasajero a ruta ${ruta['id_ruta']}");
                                },
                                child: const Text(
                                  "+  Añadir pasajero",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          )
                        : const Center(
                            child: Text(
                              '✅ Viaje finalizado',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
