import 'package:flutter/material.dart';
import 'package:app_fluvial/views/widgets/fluvial_modal_add_pasajero.dart';

class FluvilaAddTravel extends StatefulWidget {
  const FluvilaAddTravel({super.key});

  @override
  State<FluvilaAddTravel> createState() => _FluvilaAddTravelState();
}

class _FluvilaAddTravelState extends State<FluvilaAddTravel> {
  List<String> tipoDoc = ["MASUSA", "HENRY", "PRODUCTORES"];
  String? pSalidaSeleccionado;
  String? pLlegadaSeleccionado;

  final _cantidadDePasajeros = TextEditingController();
  List<Map<String, String>> tripulantes = [];

  Future<void> _showMyDialog() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const FluvialModalAddPasajero();
      },
    );

    if (result != null) {
      setState(() {
        tripulantes.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        title: const Text(
          'Crear nuevo viaje',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCardViaje(colors),
                const SizedBox(height: 20),
                _buildCardTripulacion(colors),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   border: Border.all(color: Colors.grey),
                  //   borderRadius: const BorderRadius.all(
                  //     Radius.circular(15),
                  //   ),
                  // ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          const Text(
                            '👥  TRIPULANTES AÑADIDOS',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: tripulantes.length,
                            itemBuilder: (context, index) {
                              final trip = tripulantes[index];
                              return Card(
                                color: Colors.white,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                child: ListTile(
                                  leading: const Icon(Icons.person),
                                  title: Text(
                                    "${trip['nombres']} ${trip['apellidos']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    "📄 ${trip['documento']}   |   🧰 ${trip['puesto']}",
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.black87),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        tripulantes.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
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
                    child: const Text(
                      '➕ Agregar Nuevo Viaje',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardViaje(ColorScheme colors) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardHeader("🚢 Ruta de embarcación"),
              const SizedBox(height: 16),
              _buildLabel("Puerto de salida"),
              _buildDropdown(tipoDoc, pSalidaSeleccionado, (value) {
                setState(() {
                  pSalidaSeleccionado = value;
                });
              }),
              const SizedBox(height: 16),
              _buildLabel("Puerto de llegada"),
              _buildDropdown(tipoDoc, pLlegadaSeleccionado, (value) {
                setState(() {
                  pLlegadaSeleccionado = value;
                });
              }),
              const SizedBox(height: 16),
              _buildLabel("Cantidad de pasajeros"),
              const SizedBox(height: 8),
              TextFormField(
                controller: _cantidadDePasajeros,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("Ej: 15"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardTripulacion(ColorScheme colors) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCardHeader("👥  Tripulación"),
              ElevatedButton.icon(
                onPressed: _showMyDialog,
                icon: const Icon(Icons.add),
                label: const Text("Agregar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
      ),
    );
  }

  Widget _buildDropdown(
    List<String> opciones,
    String? valorSeleccionado,
    void Function(String?) onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: valorSeleccionado,
      items: opciones
          .map((op) => DropdownMenuItem(value: op, child: Text(op)))
          .toList(),
      onChanged: onChanged,
      decoration: _inputDecoration("Seleccionar"),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      labelText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }
}
