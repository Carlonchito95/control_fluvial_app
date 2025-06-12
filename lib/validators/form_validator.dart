class FormValidator {
  static String? validateNameUser(String? value) {
    if (value == null || value.isEmpty) return "Nombre de Usuario Requerido";
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Contraseña obligatoria';
    if (value.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) return "Nombre de Usuario Requerido";
    return null;
  }

  static String? validateApellidos(String? value) {
    if (value == null || value.isEmpty) return "Apellido de Usuario Requerido";
    return null;
  }

  static String? validateNacionalidad(String? value) {
    if (value == null || value.isEmpty) {
      return "Nacionalidad de Usuario Requerido";
    }
    return null;
  }
}
