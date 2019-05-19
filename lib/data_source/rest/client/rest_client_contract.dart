import 'package:my_finance_flutter/data_source/rest/api/repository/repository_contract.dart';

abstract class RestClient {
  void setup();
  RepositoryRestApi getRepositoryApi();
}
