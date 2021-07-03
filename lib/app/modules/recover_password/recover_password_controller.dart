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

    if (json?.isEmpty == true) return false;

    final List<UserModel> users = (json as List).map<UserModel>((item) => UserModel.fromJson(item)).toList();

    bool existsEmail = false;

    for (var user in users) {
      if (user.email == _email) {
        existsEmail = true;
        break;
      }
    }

    return existsEmail;
  }

  String msgEmailUnsent = 'O email informado não foi encontrado em nossa base de dados';
  late String msgEmailSend =
      'Enviamos um email para $_email, com as instruções e o link para você trocar a senha. caso você ' +
          'não receba o e-mail em alguns minutos, verifique a sua caixa de spam ou repita o processo.';
}
