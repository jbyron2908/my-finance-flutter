import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/controller/operation_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_form.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_action_bar/bottom_action_bar.dart';

class OperationFormView extends StatelessWidget {
  final OperationFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Operation'),
      ),
      body: BottomActionBar(
        child: OperationForm(),
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
