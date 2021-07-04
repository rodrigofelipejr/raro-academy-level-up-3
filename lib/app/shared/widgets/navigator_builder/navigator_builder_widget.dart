import 'package:flutter/material.dart';
import 'package:sys_app/app/shared/widgets/navigator_builder/widgets/widgets.dart';

import 'widgets/navigator_widget.dart';

class NavigatorBuilderWidget extends StatefulWidget {
  final List<Widget> pages;
  final Future<bool> Function() onWillPop;
  final Future<void> Function() onSave;

  const NavigatorBuilderWidget({
    Key? key,
    required this.pages,
    required this.onWillPop,
    required this.onSave,
  }) : super(key: key);

  @override
  NavigatorBuilderState createState() => NavigatorBuilderState();
}

class NavigatorBuilderState extends State<NavigatorBuilderWidget> {
  late List<Widget> _stackPages;
  late int _totalPages;

  int indexPage = 0;

  bool get _isLastStep => indexPage == _totalPages;
  bool get _isFirstStep => indexPage == 0;

  @override
  void initState() {
    _stackPages = [widget.pages[0]];
    _totalPages = widget.pages.length - 1;
    super.initState();
  }

  void _nextPage() {
    if ((indexPage + 1) <= (_totalPages)) {
      _stackPages.add(widget.pages[++indexPage]);
      setState(() {});
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
            onComplete: widget.onSave,
          ),
          left: 0,
          right: 0,
          bottom: 0,
        )
      ],
    );
  }
}
