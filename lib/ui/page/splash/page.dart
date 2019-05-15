import 'package:flutter/material.dart';
import 'package:my_finance_flutter/navigation/route_manager.dart';
import 'package:my_finance_flutter/ui/inherited/app_scope.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _setup() async {
    var appScope = AppScope.of(context);
    await appScope.database.setup();
    RouteManager.navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("My Finance"),
          ],
        ),
      ),
    );
  }
}
