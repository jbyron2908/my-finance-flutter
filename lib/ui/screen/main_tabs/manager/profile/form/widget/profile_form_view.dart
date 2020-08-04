import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/controller/profile_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/widget/profile_form.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_action_bar/bottom_action_bar.dart';

class ProfileFormView extends StatelessWidget {
  final ProfileFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Profile'),
      ),
      body: BottomActionBar(
        child: ProfileForm(),
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
