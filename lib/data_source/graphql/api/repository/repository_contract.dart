import 'package:my_finance_flutter/data_source/graphql/model/repository.dart';

abstract class RepositoryGraphqlApi {
  Future<List<Repository>> getRepositories(int limit);
}
