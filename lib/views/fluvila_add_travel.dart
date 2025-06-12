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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const FluvialModalAddPasajero();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear nuevo viaje',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
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
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text('List Empty'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardViaje(ColorScheme colors) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardHeader("🔲  Datos del viaje"),
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
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
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
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}
