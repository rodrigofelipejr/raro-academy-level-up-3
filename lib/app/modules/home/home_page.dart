import 'package:flutter/material.dart';
import 'package:sys_app/app/shared/helpers/helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      body: Center(
        child: Text(
          'Olá, ${args != null ? (args as Map<String, dynamic>).entries.first.value + '.' : 'Tudo bem?'}',
          style: AppTypography.kStyleTextHeadline5,
        ),
      ),
    );
  }
}
