import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:provider/provider.dart';

class AppSetup with ChangeNotifier {
  static AppSetup of(BuildContext context) => Provider.of<AppSetup>(context);

  AppSetup(this._databaseClient) {
    setupApp();
  }

  DatabaseClient _databaseClient;

  bool busy = false;
  bool initialized = false;

  void setupApp() async {
    if (!initialized) {
      busy = true;
      notifyListeners();

      await _databaseClient.setup();
      initialized = true;

      busy = false;
      notifyListeners();
    }
  }
}
