import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/widget/item/profile_item.dart';

class BalanceList extends StatelessWidget {
  final AppDataController appDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        itemCount: appDataController.profileList.value.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) => ProfileItem(
          appDataController.profileList.value[index],
        ),
      ),
    );
  }
}
