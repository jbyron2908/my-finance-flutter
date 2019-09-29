import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_finance_flutter/core/provider/navigation/app_router.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/ui/app/provider_setup.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _i18n = I18n.delegate;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: buildApp(),
    );
  }

  MaterialApp buildApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: {
        GlobalMaterialLocalizations.delegate,
        _i18n,
      },
      supportedLocales: _i18n.supportedLocales,
      localeResolutionCallback: _i18n.resolution(fallback: Locale("en", "US")),
      onGenerateRoute: AppRouter.generateRoutes,
    );
  }
}
