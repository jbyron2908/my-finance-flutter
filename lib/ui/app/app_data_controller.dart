import 'package:get/get.dart';
import 'package:my_finance_flutter/core/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/repository/account/account_repository.dart';
import 'package:my_finance_flutter/core/repository/category/category_repository.dart';
import 'package:my_finance_flutter/core/repository/label/label_repository.dart';
import 'package:my_finance_flutter/core/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/core/repository/profile/profile_repository.dart';

class AppDataController extends GetxController {
  final ProfileRepository profileRepository = Get.find();
  final AccountRepository accountRepository = Get.find();
  final CategoryRepository categoryRepository = Get.find();
  final PayeeRepository payeeRepository = Get.find();
  final LabelRepository labelRepository = Get.find();

  final Rx<List<ProfileModel>> profileList = Rx();
  final Rx<List<AccountModel>> accountList = Rx();
  final Rx<List<CategoryModel>> categoryList = Rx();
  final Rx<List<PayeeModel>> payeeList = Rx();
  final Rx<List<LabelModel>> labelList = Rx();

  final Rx<List<OperationTypeModel>> operationTypeList = Rx();
  final Rx<List<OperationStateModel>> operationStateList = Rx();

  @override
  void onInit() {
    profileList.bindStream(profileRepository.profileListStream);
    accountList.bindStream(accountRepository.accountListStream);
    categoryList.bindStream(categoryRepository.categoryListStream);
    payeeList.bindStream(payeeRepository.payeeListStream);
    labelList.bindStream(labelRepository.labelListStream);
    profileList.bindStream(profileRepository.profileListStream);

    operationTypeList.value = OperationTypeConstants.operationTypeList;
    operationStateList.value = OperationStateConstants.operationStateList;
  }
}
