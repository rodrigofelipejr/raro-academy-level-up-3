class NameValidator {
  static String? validate(String? value) {
    final regexp = RegExp(r"^[a-zA-Z]{3}");
    final isValid = value != null && value.trim().isNotEmpty && regexp.hasMatch(value);
    return isValid ? null : 'Insira um nome válido (mín. 3 caracteres)';
  }
}
