import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_screen.dart';

class AccountViewerController extends GetxController {
  final OperationRepository operationRepository = Get.find();
  final Rx<List<OperationModel>> operationList = Rx();

  AccountViewerArg argument;

  void setArgument(AccountViewerArg argument) {
    this.argument = argument;
    var operationStream = operationRepository.watchFilter(argument.account.id);
    operationList.bindStream(operationStream);
  }

  OperationModel getOperation(int index) {
    return operationList.value[index];
  }

  void navigateToOperationForm() {
    OperationFormScreen.navigateTo(OperationFormArg.create(argument.account));
  }

  void editOperation(int index) {
    var operation = getOperation(index);
    OperationFormScreen.navigateTo(OperationFormArg.edit(operation));
  }

  void copyOperation(int index) {
    var operation = getOperation(index);
    OperationFormScreen.navigateTo(OperationFormArg.copy(operation));
  }

  Future deleteOperation(int index) async {
    var operation = getOperation(index);
    return operationRepository.delete(operation);
  }
}
