import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'create_account_controller.dart';
import '../../shared/widgets/widgets.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final CreateAccountController controller = CreateAccountController();
  final _navigatorKey = GlobalKey<NavigatorBuilderState>();

  int get index => _navigatorKey.currentState?.indexPage ?? 0;

  late final List<Widget> _pages = [
    StepAPage(controller),
    StepBPage(controller),
    StepCPage(controller),
    StepDPage(controller),
  ];

  Future<bool> onWillPop() async {
    return _navigatorKey.currentState?.indexPage == 0 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: NavigatorBuilderWidget(
          key: _navigatorKey,
          pages: List.from(_pages),
          onWillPop: onWillPop,
          onSave: () async => print('save'),
        ),
      ),
    );
  }
}
