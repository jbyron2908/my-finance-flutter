import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:provider/provider.dart';

class AppState with ChangeNotifier {
  static AppState of(BuildContext context) => Provider.of<AppState>(context);

  AppState(this._databaseClient);

  DatabaseClient _databaseClient;

  bool busy = true;
  bool initialized = true;
}
