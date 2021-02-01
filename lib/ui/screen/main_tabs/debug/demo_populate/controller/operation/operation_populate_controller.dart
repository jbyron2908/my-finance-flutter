import 'dart:math';

import 'package:get/get.dart';
import 'package:my_finance_flutter/core/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';

class OperationPopulateController extends GetxController {
  final AppDataController _appDataController = Get.find();
  final OperationRepository _operationRepository = Get.find();

  List<CategoryModel> get categoryList => _appDataController.categoryList.value
      .where(
        (category) => category.parent != null,
      )
      .toList();
  List<AccountModel> get accountList => _appDataController.accountList.value;
  List<PayeeModel> get payeeList => _appDataController.payeeList.value;

  final random = Random();
  var operationCount = 0;

  Future clearAll() {
    return _operationRepository.clearAll();
  }

  Future populate() async {
    await accountList.forEach(
      (account) async => populateAccount(account),
    );
  }

  void populateAccount(AccountModel account) async {
    var currentDate = DateTime.now();
    var targetDate = DateTime(2016, 1, 0);

    var operationList = <OperationModel>[];

    while (currentDate.isAfter(targetDate)) {
      var monthList = buildOperations(account, currentDate);
      operationList.addAll(monthList);

      currentDate = DateTime(
        currentDate.year,
        currentDate.month - 1,
        currentDate.day,
      );
    }

    await _operationRepository.saveAll(operationList);
  }

  List<OperationModel> buildOperations(
    AccountModel account,
    DateTime currentDate,
  ) {
    var operationList = <OperationModel>[];
    for (var i = 0; i < 100; i++) {
      var operation = OperationModel(
        title: 'Operation $operationCount',
        description: 'This is the description $operationCount',
        date: DateUtil.getDayOfTheMonth(currentDate),
        value: random.nextInt(500).toDouble(),
        type: OperationTypeConstants.deposit,
        state: OperationStateConstants.paid,
        account: account,
        profile: account.profile,
        category: getCategory(),
        payee: getPayee(),
      );

      operationList.add(operation);

      operationCount++;
    }

    return operationList;
  }

  CategoryModel getCategory() {
    return categoryList[random.nextInt(categoryList.length)];
  }

  PayeeModel getPayee() {
    return payeeList[random.nextInt(payeeList.length)];
  }
}
