import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/ui/app/app_dependecies.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  final _i18n = I18n.delegate;

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: {
          GlobalMaterialLocalizations.delegate,
          _i18n,
        },
        supportedLocales: _i18n.supportedLocales,
        localeResolutionCallback:
            _i18n.resolution(fallback: Locale("en", "US")),
        onGenerateRoute: AppRouter.generateRoutes,
      ),
    );
  }
}
