import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/controller/payee_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/widget/payee_form.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_action_bar/bottom_action_bar.dart';

class PayeeFormView extends StatelessWidget {
  final PayeeFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Payee'),
      ),
      body: BottomActionBar(
        child: PayeeForm(),
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
