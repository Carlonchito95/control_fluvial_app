import 'package:app_fluvial/views/fluvial_add_pasajero.dart';
import 'package:app_fluvial/views/fluvial_list_pasajeros.dart';
import 'package:app_fluvial/views/fluvial_login.dart';
import 'package:app_fluvial/views/fluvial_panel_viajes.dart';
import 'package:app_fluvial/views/fluvial_register_reports.dart';
import 'package:app_fluvial/views/fluvila_add_travel.dart';
import 'package:flutter/material.dart';
import './theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // home: const FluvialLogin(),
      //home: const FluvialAddPasajero(),
      // home: const FluvialRegisterReports(),
      //home: const FluvialListPasajeros(),
      // home: const FluvialPanelViajes(),
      home: const FluvilaAddTravel(),
    );
  }
}
