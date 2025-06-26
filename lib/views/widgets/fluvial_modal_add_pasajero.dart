import 'package:app_fluvial/validators/form_validator.dart';
import 'package:flutter/material.dart';

class FluvialModalAddPasajero extends StatefulWidget {
  const FluvialModalAddPasajero({super.key});

  @override
  State<FluvialModalAddPasajero> createState() =>
      _FluvialModalAddPasajeroState();
}

class _FluvialModalAddPasajeroState extends State<FluvialModalAddPasajero> {
  // Future<void> confirmarEnvio() async {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return const AlertDialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(15),
  //             ),
  //           ),
  //         );
  //       });
  // }

  List<String> listPuestos = ['Capitan', 'Timonel', 'Mestre', 'Ayudante'];
  String? puestoSeleccionado;

  final _nombresTripulanteController = TextEditingController();
  final _apellidosTripulanteController = TextEditingController();
  final _nacionalidadTripulanteController = TextEditingController();
  final _numDocTripulanteController = TextEditingController();
  final _formKeyT = GlobalKey<FormState>();

  void sendDataList() {
    if (_formKeyT.currentState!.validate()) {
      final tripulante = {
        "nombres": _nombresTripulanteController.text,
        "apellidos": _apellidosTripulanteController.text,
        "nacionalidad": _nacionalidadTripulanteController.text,
        "documento": _numDocTripulanteController.text,
        "puesto": puestoSeleccionado ?? '',
      };

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context, tripulante);
      });
    }
  }

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
          child: Form(
            key: _formKeyT,
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
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      child: TextFormField(
                        validator: FormValidator.validateNumeroDeDoc,
                        controller: _numDocTripulanteController,
                        maxLength: 8,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: 100,
                        child: ElevatedButton(
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
                            style: TextStyle(
                                color: colors.onPrimary, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Nombres',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  controller: _nombresTripulanteController,
                  validator: FormValidator.validateNameUser,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Apellidos',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  controller: _apellidosTripulanteController,
                  validator: FormValidator.validateApellidos,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Nacionalidad',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  controller: _nacionalidadTripulanteController,
                  validator: FormValidator.validateNacionalidad,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Cargo',
                  style: TextStyle(fontSize: 16),
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
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
                  validator: FormValidator.validateEmpty,
                )
              ],
            ),
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
          onPressed: sendDataList,
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}
