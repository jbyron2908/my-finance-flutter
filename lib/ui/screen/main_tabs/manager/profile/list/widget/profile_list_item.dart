import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/controller/profile_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/widget/profile_item_view.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_actions.dart';

class ProfileListItem extends StatelessWidget {
  ProfileListItem(
    this.profile, {
    Key key,
  }) : super(key: key);

  final ProfileModel profile;
  final ProfileListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: ItemActions(
        onDelete: () => _delete(),
        onEdit: () => _edit(),
        child: ProfileItemView(
          profile: profile,
        ),
      ),
    );
  }

  void _edit() {
    controller.editProfile(profile);
  }

  Future _delete() async {
    var confirmation = await DialogHelper.showAlertDialog(
      Get.context,
      title: 'Delete profile',
      content: 'Do you want to delete this profile?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    if (confirmation == true) {
      await controller.deleteProfile(profile);
    }
  }
}
