import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/api/client/api_client.dart';
import 'package:my_finance_flutter/core/data_source/api/repository/repository_api.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/repository/account/account_repository.dart';
import 'package:my_finance_flutter/core/repository/category/category_repository.dart';
import 'package:my_finance_flutter/core/repository/git_repo/git_repo_repository.dart';
import 'package:my_finance_flutter/core/repository/label/label_repository.dart';
import 'package:my_finance_flutter/core/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/core/repository/operation_state/operation_state_repository.dart';
import 'package:my_finance_flutter/core/repository/operation_type/operation_type_repository.dart';
import 'package:my_finance_flutter/core/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/core/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/core/repository/template_operation/template_operation_repository.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    Get.put(DatabaseClient());

    Get.put(RepositoryApi());

    Get.put(GitRepoRepository());
    Get.put(ProfileRepository());
    Get.put(AccountRepository());
    Get.put(CategoryRepository());
    Get.put(OperationRepository());
    Get.put(TemplateOperationRepository());
    Get.put(OperationTypeRepository());
    Get.put(OperationStateRepository());
    Get.put(PayeeRepository());
    Get.put(LabelRepository());

    Get.put(AppDataController());
  }
}
