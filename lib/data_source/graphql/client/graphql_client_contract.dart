import 'package:my_finance_flutter/data_source/graphql/api/repository/repository_contract.dart';

abstract class GraphQLClient {
  void setup();
  RepositoryGraphqlApi getRepositoryApi();
}
