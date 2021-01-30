import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';
import 'package:my_finance_flutter/ui/widgets/list/item_list.dart';

class AccountList extends StatelessWidget {
  AccountList({
    Key key,
    @required this.itemBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext, AccountModel model) itemBuilder;
  final AppDataController appDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = appDataController.accountList.value;
        list.sort(_sortAccount);
        return ItemList(
          modelList: list,
          itemBuilder: itemBuilder,
        );
      },
    );
  }

  int _sortAccount(AccountModel account1, AccountModel account2) {
    var profileResult = account1.profile.name.compareTo(account2.profile.name);
    if (profileResult == 0) {
      var nameResult = account1.name.compareTo(account2.name);
      return nameResult;
    }
    return profileResult;
  }
}
