import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/api/entity/repository_entity.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_api.dart';

class GitRepoRepository {
  final RepositoryApi _repositoryApi = Get.find();

  Future<List<Repository>> getRepositoryList(int limit) async {
    return await _repositoryApi.getRepositories(limit);
  }
}
