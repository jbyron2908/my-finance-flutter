import 'package:flutter/foundation.dart';
import 'package:my_finance_flutter/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/data_source/db/client/database_client_contract.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client_contract.dart';
import 'package:my_finance_flutter/repository/repository_provider.dart';
import 'package:my_finance_flutter/repository/repository_provider_contract.dart';

class AppState with ChangeNotifier {
  DatabaseClient _databaseClient = MyFinanceDatabaseClient();
  GraphQLClient _graphqlClient = MyFinanceGraphqlClient();

  RepositoryProvider repositoryProvider = MyFinanceRepositoryProvider();

  bool loading = true;

  void setupApp() async {
    loading = true;
    notifyListeners();

    await _databaseClient.setup();
    _graphqlClient.setup();
    await repositoryProvider.setup(
        _graphqlClient, _databaseClient);

    loading = false;
    notifyListeners();
  }
}
