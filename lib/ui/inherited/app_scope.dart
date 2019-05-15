import 'package:flutter/material.dart';
import 'package:my_finance_flutter/data_source/db/config/database.dart';

class AppScope extends InheritedWidget {
  final database = Database();

  AppScope({
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);


  @override
  bool updateShouldNotify(AppScope old) => true;

  static AppScope of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppScope) as AppScope);
  }
}
