import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/navigation/route_manager.dart';
import 'package:my_finance_flutter/ui/inherited/app_scope.dart';
import 'package:my_finance_flutter/ui/page/splash/page.dart';

class App extends StatelessWidget {
  final i18n = S.delegate;

  @override
  Widget build(BuildContext context) {
    return AppScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: {
          GlobalMaterialLocalizations.delegate,
          i18n,
        },
        supportedLocales: i18n.supportedLocales,
        localeResolutionCallback:
            i18n.resolution(fallback: new Locale("en"), withCountry: false),
        home: SplashPage(),
        onGenerateRoute: RouteManager.configureRoutes,
      ),
    );
  }
}
