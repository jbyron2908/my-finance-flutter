import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:my_finance_flutter/ui/app/app_dependecies.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      child: I18n(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: {
            GlobalMaterialLocalizations.delegate,
          },
          supportedLocales: [
            const Locale('en', "US"),
          ],
          onGenerateRoute: AppRouter().generateRoutes,
        ),
      ),
    );
  }
}
