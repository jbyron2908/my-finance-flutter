import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/view/home/home_route.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppRouter.replaceTo(context, HomeRoute());
    });

    return Scaffold(
      body: Center(
        child: Text("MyFinance"),
      ),
    );
  }
}
