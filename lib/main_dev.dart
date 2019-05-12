import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_finance_flutter/config/flavor/flavor.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/ui/page/home/index.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.DEV,
      values: FlavorValues(
          baseUrl:
              "https://raw.githubusercontent.com/JHBitencourt/ready_to_go/master/lib/json/person_qa.json"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final i18n = I18n.delegate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          i18n.resolution(fallback: new Locale("en", "US")),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
