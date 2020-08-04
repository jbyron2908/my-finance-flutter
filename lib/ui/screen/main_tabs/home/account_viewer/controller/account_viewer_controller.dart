import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/repository/operation/operation_repository.dart';

class AccountViewerController extends GetxController {
  final AccountModel account = Get.arguments;
  final OperationRepository operationRepository = Get.find();

  AccountViewerController();

  Future deleteOperation(OperationModel operation) async {
    return operationRepository.delete(operation);
  }
}
