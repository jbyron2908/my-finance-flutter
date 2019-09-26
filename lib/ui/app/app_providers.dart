import 'package:flutter/material.dart';
import 'package:my_finance_flutter/provider/app/app_state.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final AppState _appState = AppState();
  final Widget child;

  AppProviders({this.child, Key key}) : super(key: key) {
    _appState.setupApp();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: _appState,
          ),
        ],
        child: child,
      ),
    );
  }
}
