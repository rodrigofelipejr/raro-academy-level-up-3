import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/models.dart';

class LoginController {
  UserModel _currentUser = UserModel(name: '', email: '', password: '');

  void onChange({String? email, String? password}) {
    _currentUser = _currentUser.copyWith(
      email: email ?? _currentUser.email,
      password: password ?? _currentUser.password,
    );
  }

  Future<bool> handleAuthentication() async {
    final localStorage = await SharedPreferences.getInstance();
    final json = localStorage.getStringList('users');

    if (json?.isEmpty == true) return false;

    final List<UserModel> users = (json as List).map<UserModel>((item) => UserModel.fromJson(item)).toList();

    bool authenticated = false;
    for (var user in users) {
      if (user.email == _currentUser.email && user.password == _currentUser.password) {
        _currentUser = _currentUser.copyWith(name: user.name);
        authenticated = true;
        break;
      }
    }

    return authenticated;
  }

  String get userName => _currentUser.name;
}
