import 'package:flutter/material.dart';

class LoginController {
  bool verifyLogin(GlobalKey<FormState> formKey) {
    return (formKey.currentState?.validate() == true);
  }
}
