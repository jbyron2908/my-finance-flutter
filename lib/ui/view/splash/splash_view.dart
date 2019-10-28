import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/home/home_route.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeRoute.replaceTo(context);
    });

    return Scaffold(
      body: Center(
        child: Text("MyFinance"),
      ),
    );
  }
}
