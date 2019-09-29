import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/app/app_setup.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = AppSetup.of(context);

    if (appState.initialized) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppRouter.navigateToHome(context);
      });
    }

    return Scaffold(
      body: Center(
        child: Text("MyFinance"),
      ),
    );
  }
}
