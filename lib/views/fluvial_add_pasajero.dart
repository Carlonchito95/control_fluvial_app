import 'package:app_fluvial/validators/form_validator.dart';
import 'package:flutter/material.dart';

class FluvialAddPasajero extends StatefulWidget {
  const FluvialAddPasajero({super.key});

  @override
  State<FluvialAddPasajero> createState() => _FluvialAddPasajeroState();
}

class _FluvialAddPasajeroState extends State<FluvialAddPasajero> {
  List<String> tipoDoc = ["DNI", "RUC", "CE", "No Tiene"];
  List<String> subDestinos = [
    "subDestino_1",
    "subDestino_2",
    "subDestino_3",
    "subDestino_4"
  ];
  List<String> docDeclarado = ["Licencia de conducir", "C4"];
  String? docSeleccionado;
  String? subDestinoSeleccionado;
  String? docnSeleccionado;

  final _nombresController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _naiconalidadController = TextEditingController();

  final _numdocinciController = TextEditingController();
  final _nombreinciController = TextEditingController();

  final _keyGlobal = GlobalKey<FormState>();

  bool subDestino = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Agregar Pasajero",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _keyGlobal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/personita.png"),
                    const SizedBox(width: 20),
                    const Text(
                      'INFORMACIÓN DEL PASAJERO',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 5,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tipo de documento',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Seleccionar',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  items: tipoDoc.map((doc) {
                    return DropdownMenuItem(
                      value: doc,
                      child: Text(doc,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      docSeleccionado = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Número de documento',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if ((docSeleccionado ?? '') != "No Tiene") ...[
                      SizedBox(
                        height: 45,
                        width: screenWidth * 0.5,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            labelText: 'Ingrese Número',
                            labelStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: colors.primary,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Validar',
                            style: TextStyle(
                                color: colors.onPrimary, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 20),

                // Mostrar si el docSeleccionado es distinto de "No Tiene"
                if ((docSeleccionado ?? '') != "No Tiene") ...[
                  InputForm(
                    validator: FormValidator.validateNameUser,
                    controller: _nombresController,
                    label: 'Nombres',
                  ),
                  const SizedBox(height: 20),
                  InputForm(
                    validator: FormValidator.validateApellidos,
                    controller: _apellidosController,
                    label: 'Apellidos',
                  ),
                  const SizedBox(height: 20),
                  InputForm(
                    validator: FormValidator.validateNacionalidad,
                    controller: _naiconalidadController,
                    label: 'Nacionalidad',
                  ),
                  const SizedBox(height: 20),
                ],

                if (docSeleccionado == "No Tiene") ...[
                  Card(
                    color: const Color(0xffffdaa7),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/icons/Alert_triangle.png"),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Registro con incidencia',
                                style: TextStyle(
                                  color: colors.primary,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 5,
                            width: double.infinity,
                            decoration: const BoxDecoration(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)))),
                              items: docDeclarado.map((docn) {
                                return DropdownMenuItem(
                                  value: docn,
                                  child: Text(docn),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  docnSeleccionado = value;
                                });
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Número de documento',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          InputFormInci(
                            tipoEntrada: TextInputType.number,
                            controller: _numdocinciController,
                            validator: FormValidator.validateNumeroDeDoc,
                            labelText: 'Ingresar Num. Doc.',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Nombres',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          InputFormInci(
                              tipoEntrada: TextInputType.name,
                              controller: _nombreinciController,
                              validator: FormValidator.validateNameUser,
                              labelText: 'Ingresar Nombres'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Apellidos',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          InputFormInci(
                              tipoEntrada: TextInputType.name,
                              controller: _nombreinciController,
                              validator: FormValidator.validateApellidos,
                              labelText: 'Ingresar Nombres'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Nacionalidad',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          InputFormInci(
                              tipoEntrada: TextInputType.name,
                              controller: _nombreinciController,
                              validator: FormValidator.validateNacionalidad,
                              labelText: 'Ingresar Nacionalidad'),
                        ],
                      ),
                    ),
                  )
                ],

                Row(
                  children: [
                    Checkbox(
                      value: subDestino,
                      onChanged: (value) {
                        setState(() {
                          subDestino = value!;
                        });
                      },
                    ),
                    const Text(
                      "Agregar Sub Destino",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey),
                    )
                  ],
                ),
                if (subDestino) ...[
                  const Text(
                    '  Sub Destino',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'Seleccionar Sub Destino',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    items: subDestinos.map((destino) {
                      return DropdownMenuItem(
                        value: destino,
                        child: Text(destino),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        subDestinoSeleccionado = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Selecciona un sub destino' : null,
                  ),
                  const SizedBox(height: 20),
                ],

                if ((docSeleccionado ?? '') != "No Tiene") ...[
                  Center(
                    child: SizedBox(
                      width: 250,
                      child: BotonesRegistro(
                        onPressed: () {},
                        text: "Añadir Pasajero",
                        fondo: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 400,
                      child: BotonesRegistro(
                          onPressed: () {}, text: 'Terminar Registro'),
                    ),
                  ),
                ],
                if (docSeleccionado == "No Tiene") ...[
                  Center(
                    child: SizedBox(
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              )),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                          label: Text(
                            "Registrar con incidencias",
                            style: TextStyle(
                                color: colors.onPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputFormInci extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextInputType tipoEntrada;
  const InputFormInci({
    required this.tipoEntrada,
    required this.controller,
    required this.validator,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: tipoEntrada,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.all(10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}

class BotonesRegistro extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? fondo;
  final Color? colorTexto;
  const BotonesRegistro({
    super.key,
    required this.onPressed,
    required this.text,
    this.fondo,
    this.colorTexto,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyle(
            color: colorTexto ?? colors.onPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: fondo ?? colors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const InputForm({
    required this.label,
    required this.controller,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
