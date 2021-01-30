import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';
import 'package:my_finance_flutter/ui/widgets/list/item_list.dart';

class ProfileList extends StatelessWidget {
  ProfileList({
    Key key,
    @required this.itemBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext, ProfileModel model) itemBuilder;

  final AppDataController appDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ItemList(
        modelList: appDataController.profileList.value,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
