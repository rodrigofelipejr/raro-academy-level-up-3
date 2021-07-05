import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class NavigatorBuilderWidget extends StatefulWidget {
  final List<Map<Widget, bool Function()>> steps;
  final Future<bool> Function() onWillPop;
  final Function onSave;

  const NavigatorBuilderWidget({
    Key? key,
    required this.steps,
    required this.onWillPop,
    required this.onSave,
  }) : super(key: key);

  @override
  NavigatorBuilderState createState() => NavigatorBuilderState();
}

class NavigatorBuilderState extends State<NavigatorBuilderWidget> {
  late int _totalPages;

  int indexPage = 0;
  List<Widget> _listPages = [];
  List<Function> _listFunctions = [];
  List<Widget> _stackPages = [];

  bool get _isLastStep => indexPage == _totalPages;
  bool get _isFirstStep => indexPage == 0;

  @override
  void initState() {
    _listPages = widget.steps.map<Widget>((e) => e.entries.first.key).toList();
    _listFunctions = widget.steps.map<Function>((e) => e.entries.first.value).toList();

    _totalPages = _listPages.length - 1;
    _stackPages.add(_listPages[0]);

    super.initState();
  }

  void _nextPage() {
    if (_listFunctions[indexPage].call()) {
      if ((indexPage + 1) <= (_totalPages)) {
        _stackPages.add(_listPages[++indexPage]);
        setState(() {});
      }
    }
  }

  void _onComplete() {
    if (_listFunctions[indexPage].call()) {
      widget.onSave();
    }
  }

  void _previewsPage() {
    if (_stackPages.length > 1) {
      _stackPages.removeAt(indexPage--);
      setState(() {});
    } else {
      widget.onWillPop();
    }
  }

  bool _onPopPage(route, result) {
    if (route.didPop(result)) {
      _previewsPage();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NavigatorWidget(
          onPopPage: _onPopPage,
          pages: _stackPages.map((page) => MaterialPage(child: page)).toList(),
        ),
        Positioned(
          child: ManagerButtonsStepsWidget(
            isFirstStep: _isFirstStep,
            isLastStep: _isLastStep,
            nextPage: _nextPage,
            previewsPage: _previewsPage,
            onComplete: _onComplete,
          ),
          left: 24.0,
          right: 24.0,
          bottom: 24.0,
        )
      ],
    );
  }
}
