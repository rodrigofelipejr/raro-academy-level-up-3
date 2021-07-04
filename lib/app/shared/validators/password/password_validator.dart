class PasswordValidator {
  // static final RegExp regexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
  static final RegExp regexp = RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}$');

  static String? validate(String? value) {
    final isValid = value != null && value.trim().isNotEmpty && regexp.hasMatch(value);
    return isValid ? null : 'Insira uma senha válida (mín. 6 caracteres)';
  }

  static String? toCompare({String? value, String? compare}) {
    final isValid = value != null && value.trim().isNotEmpty && regexp.hasMatch(value);
    return isValid ? null : 'Insira uma senha válida (mín. 6 caracteres)';
  }
}
