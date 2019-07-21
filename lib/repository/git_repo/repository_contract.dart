import 'package:my_finance_flutter/data_source/graphql/model/repository.dart';

abstract class GitRepoRepository {
  Future<List<Repository>> getRepositoryListGraphql(int limit);
}
