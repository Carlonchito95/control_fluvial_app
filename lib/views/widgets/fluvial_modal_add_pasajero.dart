import 'package:flutter/material.dart';

class FluvialModalAddPasajero extends StatefulWidget {
  const FluvialModalAddPasajero({super.key});

  @override
  State<FluvialModalAddPasajero> createState() =>
      _FluvialModalAddPasajeroState();
}

class _FluvialModalAddPasajeroState extends State<FluvialModalAddPasajero> {
  Future<void> confirmarEnvio() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          );
        });
  }

  List<String> listPuestos = ['Capitan', 'Timonel', 'Mestre', 'Ayudante'];
  String? puestoSeleccionado;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: const Text('👥  Añadir tripulación'),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: ListBody(
            children: [
              Container(
                height: 5,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'N° Documento',
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Validar',
                      style: TextStyle(color: colors.onPrimary, fontSize: 18),
                    ),
                  ),
                ],
              ),
              const Text(
                'Nombres',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Apellidos',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Nacionalidad',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'seleccionar',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  value: puestoSeleccionado,
                  items: listPuestos.map((puesto) {
                    return DropdownMenuItem(
                      value: puesto,
                      child: Text(puesto),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      puestoSeleccionado = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Seleccion un puesto' : null,
                ),
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Aceptar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
