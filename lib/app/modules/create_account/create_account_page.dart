import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'create_account_controller.dart';
import '../../shared/widgets/widgets.dart';
import '../../shared/helpers/helpers.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final CreateAccountController controller = CreateAccountController();

  final _navigatorKey = GlobalKey<NavigatorBuilderState>();

  final _keyStepA = GlobalKey<StepAPageState>();
  final _keyStepB = GlobalKey<StepBPageState>();
  final _keyStepC = GlobalKey<StepCPageState>();
  final _keyStepD = GlobalKey<StepDPageState>();

  late final List<Map<Widget, bool Function()>> _mapSteps = [
    {StepAPage(controller, key: _keyStepA): () => _keyStepA.currentState?.isStepValid == true},
    {StepBPage(controller, key: _keyStepB): () => _keyStepB.currentState?.isStepValid == true},
    {StepCPage(controller, key: _keyStepC): () => _keyStepC.currentState?.isStepValid == true},
    {StepDPage(controller, key: _keyStepD): () => _keyStepD.currentState?.isStepValid == true},
  ];

  int get index => _navigatorKey.currentState?.indexPage ?? 0;

  Future<bool> onWillPop() async {
    return _navigatorKey.currentState?.indexPage == 0 ? true : false;
  }

  void onSave() async {
    final isValid = await controller.handleCreateAccount();

    isValid
        ? showMessage(
            context,
            title: 'Sucesso',
            message: 'Tudo certo! Agora você já pode acessar a sua conta.',
            label: 'Ir para Login',
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            isDismissible: false,
          )
        : showMessage(
            context,
            title: 'Algo deu errado!',
            message: 'Não foi possível processar a sua solicitação, tente novamente mais tarde.',
          );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: NavigatorBuilderWidget(
          key: _navigatorKey,
          steps: _mapSteps,
          onWillPop: onWillPop,
          onSave: () => onSave(),
        ),
      ),
    );
  }
}
