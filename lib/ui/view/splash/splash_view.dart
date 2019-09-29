import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/app/app_setup.dart';
import 'package:my_finance_flutter/core/provider/navigation/app_router.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = AppSetup.of(context);

    if (appState.initialized) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppRouter.of(context).navigateToHome(context);
      });
    }

    return Scaffold(
      body: Center(
        child: Text("MyFinance"),
      ),
    );
  }
}
