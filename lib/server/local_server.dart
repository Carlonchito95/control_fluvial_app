import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:flutter/services.dart';
//import 'dart:convert';
import "package:path/path.dart" as p;
import 'dart:async';
import 'package:shelf_router/shelf_router.dart';

class LocalServer {
  late Database database;

  Future<void> _initDatabase() async {
    Directory directorioDocument = await getApplicationDocumentsDirectory();
    String path = p.join(directorioDocument.path, 'database.db');

    print('intendando abrir a base de datos en: $path');

    if (await File(path).exists()) {
      try {
        database = await openDatabase(path);
        print("✅ Base de datos abierta correctamente.");
      } catch (e) {
        print("⚠️ Error al abrir la base de datos. Eliminando...");
        await File(path).delete();
      }
    }

    if (!await File(path).exists()) {
      print("📦 Copiando base de datos desde assets...");
      ByteData data = await rootBundle.load("assets/database.db");
      List<int> bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes, flush: true);
      print("✅ Base de datos copiada correctamente.");
    }

    database = await openDatabase(path, version: 1, readOnly: false);
  }

  Future<Response> _listaDeViajesPorUsuario(Request request) async {
    try {
      final body = await request.readAsString();
      final data = jsonDecode(body);

      if (!data.containsKey('len_int_id')) {
        return Response.badRequest(
          body: jsonEncode({'error': 'Falta el parámetro len_int_id'}),
        );
      }

      final int lenIntId = int.parse(data['len_int_id'].toString());

      final List<Map<String, dynamic>> modules = await database.query(
        'database',
        where: 'len_int_id = ?',
        whereArgs: [lenIntId],
      );

      return Response.ok(jsonEncode(modules),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({'error': 'Error en _allModules: $e'}),
      );
    }
  }

  Future<void> iniciarServidor() async {
    await _initDatabase();

    final router = Router();
    router.post('/get_list_viajes', _listaDeViajesPorUsuario);

    final handler =
        const Pipeline().addMiddleware(logRequests()).addHandler(router);
    final server = await shelf_io.serve(handler, 'localhost', 8080);

    final url = 'http://${server.address.host}:${server.port}';
    print('📡 Servidor local iniciado en $url');
  }
}
