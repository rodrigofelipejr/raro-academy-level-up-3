import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';

class NavigatorBuilder extends StatefulWidget {
  final List<Widget> pages;
  final Future<bool> Function() onWillPop;
  final Future<void> Function() onSave;

  const NavigatorBuilder({
    Key? key,
    required this.pages,
    required this.onWillPop,
    required this.onSave,
  }) : super(key: key);

  @override
  NavigatorBuilderState createState() => NavigatorBuilderState();
}

class NavigatorBuilderState extends State<NavigatorBuilder> {
  late List<Widget> _stackPages;
  late int _totalPages;

  int indexPage = 0;

  @override
  void initState() {
    _stackPages = [widget.pages[0]];
    _totalPages = widget.pages.length - 1;
    super.initState();
  }

  void nextPage() {
    if ((indexPage + 1) <= (_totalPages)) {
      _stackPages.add(widget.pages[++indexPage]);
      setState(() {});
    }
  }

  void previewsPage() {
    if (_stackPages.length > 1) {
      _stackPages.removeAt(indexPage--);
      setState(() {});
    } else {
      widget.onWillPop();
    }
  }

  bool _onPopPage(route, result) {
    if (route.didPop(result)) {
      previewsPage();
      return true;
    } else {
      return false;
    }
  }

  bool get _isLastStep => indexPage == _totalPages;
  bool get _isFirstStep => indexPage == 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Navigator(
          onPopPage: _onPopPage,
          pages: _stackPages.map((page) => MaterialPage(child: page)).toList(),
        ),
        Positioned(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!_isFirstStep)
                Expanded(
                  child: ElevatedButtonWidget(
                    onPressed: previewsPage,
                    child: Text('Voltar'),
                  ),
                ),
              if (!_isLastStep)
                Expanded(
                  child: ElevatedButtonWidget(
                    onPressed: nextPage,
                    child: Text('Continuar'),
                  ),
                ),
              if (_isLastStep)
                Expanded(
                  child: ElevatedButtonWidget(
                    onPressed: widget.onSave,
                    child: Text('Criar conta'),
                  ),
                ),
            ],
          ),
          left: 0,
          right: 0,
          bottom: 0,
        )
      ],
    );
  }
}
