import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/core/model/profile/index.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/widget/item/account_item.dart';
import 'package:provider/provider.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem({Key key, this.profile}) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Consumer<List<AccountModel>>(
      builder: (context, accountList, child) {
        final profileAccountList = accountList
            .where(
              (account) => account.profile.id == profile.id,
            )
            .toList();

        return Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              UIHelper.verticalSpaceSmall,
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: profileAccountList.length,
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
