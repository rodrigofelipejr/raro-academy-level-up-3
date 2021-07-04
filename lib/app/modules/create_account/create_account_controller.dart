import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/models.dart';

class CreateAccountController {
  UserModel newUser = UserModel(name: '', email: '', password: '');

  void onChange({String? name, String? email, String? password}) {
    newUser = newUser.copyWith(
      name: name ?? newUser.name,
      email: email ?? newUser.email,
      password: password ?? newUser.password,
    );
  }

  Future<bool> handleCreateAccount() async {
    final localStorage = await SharedPreferences.getInstance();
    final data = localStorage.getStringList('users') ?? [];

    if (data.isEmpty) {
      data.add(newUser.toJson());
      localStorage.setStringList('users', data);
      return false;
    }

    final users = data.map((user) => UserModel.fromJson(user)).toList();

    bool emailAlready = false;
    for (var user in users) {
      if (user.email == newUser.email) {
        emailAlready = true;
        break;
      }
    }

    if (emailAlready) {
      return false;
    }

    users.add(newUser);
    final json = users.map((user) => user.toJson()).toList();
    localStorage.setStringList('users', json);

    return true;
  }
}
