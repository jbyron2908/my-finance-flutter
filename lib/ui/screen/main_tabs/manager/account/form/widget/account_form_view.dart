import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/controller/account_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/widget/account_form.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_action_bar/bottom_action_bar.dart';

class AccountFormView extends StatelessWidget {
  final AccountFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Account'),
      ),
      body: BottomActionBar(
        child: AccountForm(),
        actionList: [
          BottomActionItem(
            icon: Icons.cancel,
            onTap: () => controller.cancel(),
          ),
          BottomActionItem(
            icon: Icons.save,
            onTap: () => controller.submit(),
          ),
        ],
      ),
    );
  }
}
