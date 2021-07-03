import 'package:flutter/material.dart';

import 'modules/modules.dart';
import 'shared/helpers/helpers.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Level Up #3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => SplashPage(),
        AppRoutes.login: (_) => LoginPage(),
        AppRoutes.createAccount: (_) => CreateAccountPage(),
        AppRoutes.recoverPassword: (_) => RecoverPasswordPage(),
        AppRoutes.home: (_) => HomePage(),
      },
    );
  }
}
