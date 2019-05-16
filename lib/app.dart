import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_finance_flutter/bloc/app/bloc.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/navigation/route_manager.dart';
import 'package:my_finance_flutter/ui/page/home/page.dart';
import 'package:my_finance_flutter/ui/page/splash/page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _i18n = I18n.delegate;
  AppBloc _appBloc;

  @override
  void initState() {
    _appBloc = AppBloc();
    _appBloc.appStarted();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: _appBloc,
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
          home: BlocBuilder(
            bloc: _appBloc,
            builder: (BuildContext context, AppState state) {
              if (state is AppReadyState) {
                return HomePage();
              } else {
                return SplashPage();
              }
            },
          ),
          onGenerateRoute: RouteManager.configureRoutes,
        ));
  }
}
