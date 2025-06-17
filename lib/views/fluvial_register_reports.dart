import 'package:flutter/material.dart';

class FluvialRegisterReports extends StatefulWidget {
  const FluvialRegisterReports({super.key});

  @override
  State<FluvialRegisterReports> createState() => _FluvialRegisterReportsState();
}

class _FluvialRegisterReportsState extends State<FluvialRegisterReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de reportes'),
        centerTitle: true,
      ),
    );
  }
}
