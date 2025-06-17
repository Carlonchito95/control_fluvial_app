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

  final url = "${ApiGlobal.baseUrl}/get_list_viajes";

  Future<void> _numViajesRegistrados() async {
    final response = await http.post(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
      }

      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Panel de viajes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Card(
              color: Color(0xff848484),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Text(
                  'Total de viajes registrados',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
