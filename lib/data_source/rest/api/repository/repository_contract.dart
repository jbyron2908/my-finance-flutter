import 'package:my_finance_flutter/data_source/rest/model/repository.dart';

abstract class RepositoryRestApi {
  Future<List<Repository>> getRepositories(int page, int perPage);
}
