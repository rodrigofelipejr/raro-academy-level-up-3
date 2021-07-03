class EmailValidator {
  static String? validate(String? value) {
    final regexp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.([a-zA-Z]{2})+");
    final isValid = value != null && value.trim().isNotEmpty && regexp.hasMatch(value);
    return isValid ? null : 'Insira um email válido';
  }
}
