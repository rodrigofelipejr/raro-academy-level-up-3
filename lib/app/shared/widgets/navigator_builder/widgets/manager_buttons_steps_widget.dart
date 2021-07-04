import 'package:flutter/material.dart';

import '../../widgets.dart';

class ManagerButtonsStepsWidget extends StatelessWidget {
  final bool isFirstStep;
  final bool isLastStep;
  final void Function() previewsPage;
  final void Function() nextPage;
  final void Function() onComplete;

  const ManagerButtonsStepsWidget({
    Key? key,
    required this.isFirstStep,
    required this.isLastStep,
    required this.previewsPage,
    required this.nextPage,
    required this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!isFirstStep)
          Expanded(
            child: ElevatedButtonWidget(
              onPressed: previewsPage,
              label: 'Voltar',
            ),
          ),
        if (!isLastStep)
          Expanded(
            child: ElevatedButtonWidget(
              onPressed: nextPage,
              label: 'Continuar',
            ),
          ),
        if (isLastStep)
          Expanded(
            child: ElevatedButtonWidget(
              onPressed: onComplete,
              label: 'Criar conta',
            ),
          ),
      ],
    );
  }
}
