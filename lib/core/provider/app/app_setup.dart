import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:provider/provider.dart';

class AppSetup with ChangeNotifier {
  static AppSetup of(BuildContext context) => Provider.of<AppSetup>(context);

  AppSetup(this._databaseClient);

  DatabaseClient _databaseClient;

  bool busy = true;
  bool initialized = true;
}
