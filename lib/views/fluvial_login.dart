import 'package:app_fluvial/validators/form_validator.dart';
import 'package:app_fluvial/views/fluvial_home.dart';
import 'package:flutter/material.dart';

class FluvialLogin extends StatefulWidget {
  const FluvialLogin({super.key});

  @override
  State<FluvialLogin> createState() => _FluvialLoginState();
}

class _FluvialLoginState extends State<FluvialLogin> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool ocultarPassword = true;

  void _sendData() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const FluvialHome()),
        (Route<dynamic> route) => false,
      );
    }
  }

  void ocultartext() {
    setState(() {
      ocultarPassword = !ocultarPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo_munimaynas.png", scale: 1),
              const SizedBox(height: 49),
              TextFormField(
                validator: FormValidator.validateNameUser,
                controller: _userController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: Image.asset("assets/icons/person.png", scale: 4),
                  hintText: 'Usuario',
                  hintStyle:
                      TextStyle(color: colors.onSurface.withOpacity(0.5)),
                  labelText: "Ingresar Usuario",
                  labelStyle:
                      TextStyle(color: colors.onSurface.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: FormValidator.validatePassword,
                controller: _passwordController,
                obscureText: ocultarPassword,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/icons/password.png", scale: 3),
                  ),
                  suffixIcon: IconButton(
                    onPressed: ocultartext,
                    icon: ocultarPassword
                        ? Image.asset('assets/icons/view.png',
                            scale: 20, color: colors.onSurface.withOpacity(0.5))
                        : Image.asset('assets/icons/eye.png',
                            scale: 20,
                            color: colors.onSurface.withOpacity(0.5)),
                  ),
                  hintText: 'Contraseña',
                  hintStyle:
                      TextStyle(color: colors.onSurface.withOpacity(0.5)),
                  labelText: "Ingresar Contraseña",
                  labelStyle:
                      TextStyle(color: colors.onSurface.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 50),
                  elevation: 2,
                  backgroundColor: colors.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                onPressed: _sendData,
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: colors.onPrimary,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
