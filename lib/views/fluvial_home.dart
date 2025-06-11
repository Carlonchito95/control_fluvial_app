import 'package:app_fluvial/views/fluvila_add_travel.dart';
import 'package:app_fluvial/views/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class FluvialHome extends StatefulWidget {
  const FluvialHome({super.key});

  @override
  State<FluvialHome> createState() => _FluvialHomeState();
}

class _FluvialHomeState extends State<FluvialHome> {
  void _onClickAddTravel() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FluvilaAddTravel(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      backgroundColor: colors.surface,
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: colors.primary,
        iconTheme: IconThemeData(color: colors.onPrimary),
        title: Text(
          "Control Fluvial App",
          style:
              TextStyle(color: colors.onPrimary, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding:
            const EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Programación de viajes',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 50),
                  backgroundColor: colors.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onPressed: _onClickAddTravel,
                label: Text(
                  'Agregar nuevo viaje',
                  style: TextStyle(color: colors.onPrimary, fontSize: 20),
                ),
                icon: Icon(
                  Icons.add,
                  color: colors.onPrimary,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Crear Viaje',
        child: const Icon(Icons.add),
      ),
    );
  }
}
