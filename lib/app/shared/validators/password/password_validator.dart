class PasswordValidator {
  static String? validate(String? value) {
    // final regexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    final regexp = RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}$');
    final isValid = value != null && value.trim().isNotEmpty && regexp.hasMatch(value);
    return isValid ? null : 'Insira uma senha válida (mín. 6 caracteres, letras e números)';
  }
}
