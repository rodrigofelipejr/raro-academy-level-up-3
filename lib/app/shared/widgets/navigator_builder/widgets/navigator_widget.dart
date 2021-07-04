import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  final bool Function(Route<dynamic>, dynamic)? onPopPage;
  final List<Page<dynamic>> pages;

  const NavigatorWidget({Key? key, required this.onPopPage, required this.pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: onPopPage,
      pages: pages,
    );
  }
}
