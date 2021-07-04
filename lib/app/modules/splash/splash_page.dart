import 'package:flutter/material.dart';

import '../../shared/helpers/helpers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 0;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2500)).then(
      (_) => Navigator.pushReplacementNamed(context, AppRoutes.login),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).size.height * 0.25;

    Future.delayed(Duration(microseconds: 500)).then((_) => setState(() => _opacity = 1.0));

    return Scaffold(
      body: Container(
        color: AppColors.kBlue1,
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 128.0, maxWidth: 128.0),
          child: SizedBox(
            height: scale,
            width: scale,
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(AppImages.logoWhite, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
