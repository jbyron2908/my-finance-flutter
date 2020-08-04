import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/unknown/widget/unknown_view.dart';

class UnknownScreen extends StatelessWidget {
  static String get _routePath => '/';
  static GetPage get route => GetPage(
        name: UnknownScreen._routePath,
        page: () => UnknownScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: UnknownView(),
    );
  }
}
