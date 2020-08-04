import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/widget/item/account_item.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem(
    this.profile, {
    Key key,
  }) : super(key: key);

  final ProfileModel profile;
  final AppDataController appDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var accountList = appDataController.accountList.value;
        final profileAccountList = accountList
            .where(
              (account) => account.profile.id == profile.id,
            )
            .toList();

        return Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  profile.name,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Divider(
                indent: 8,
                endIndent: 8,
                color: Colors.grey,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: profileAccountList.length,
                separatorBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                itemBuilder: (context, index) => AccountItem(
                  account: profileAccountList[index],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
