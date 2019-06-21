import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_finance_flutter/provider/app/app_provider.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/navigation/route_manager_contract.dart';
import 'package:my_finance_flutter/ui/page/home/page.dart';
import 'package:my_finance_flutter/ui/page/splash/page.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _i18n = I18n.delegate;
  AppState _appState;

  @override
  void initState() {
    _appState = AppState();
    _appState.setupApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: _appState,
          ),
        ],
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
              _i18n.resolution(fallback: new Locale("en", "US")),
          home: Consumer<AppState>(
            builder: (context, state, _) {
              if (state.loading == false) {
                return HomePage();
              } else {
                return SplashPage();
              }
            },
          ),
          onGenerateRoute: RouteManager.instance.configureRoutes,
        ));
  }
}
