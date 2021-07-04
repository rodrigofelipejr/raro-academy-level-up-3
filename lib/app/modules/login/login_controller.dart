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
    return users.contains(_currentUser);
  }
}
