import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/app/app_state.dart';
import 'package:my_finance_flutter/core/provider/navigation/app_router.dart';

class SplashView extends StatelessWidget {
  void _appSetup(BuildContext context, AppState appState) async {
    await appState.setupApp();
    AppRouter.of(context).navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    var appState = AppState.of(context);
    _appSetup(context, appState);

    return Scaffold(
      body: Center(
        child: Text("MyFinance"),
      ),
    );
  }
}
