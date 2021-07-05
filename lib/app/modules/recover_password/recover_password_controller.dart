import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/models.dart';

class RecoverPasswordController {
  String _email = '';

  void onChange({String? email}) {
    _email = email ?? this._email;
  }

  Future<bool> handleRecoverPassword() async {
    final localStorage = await SharedPreferences.getInstance();
    final json = localStorage.getStringList('users');

    if (json == null || json.isEmpty) return false;

    final List<UserModel> users = json.map<UserModel>((item) => UserModel.fromJson(item)).toList();

    bool existsEmail = false;

    for (var user in users) {
      if (user.email == _email) {
        existsEmail = true;
        break;
      }
    }

    return existsEmail;
  }

  late String msgEmailSend =
      'Enviamos um email para $_email, com as instruções e o link para você trocar a senha. caso você ' +
          'não receba o e-mail em alguns minutos, verifique a sua caixa de spam ou repita o processo.';
}
