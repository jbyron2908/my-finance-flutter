import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/widget/profile_item.dart';
import 'package:provider/provider.dart';

class ProfileSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<ProfileModel>>(
      builder: (_, list, child) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => MainTabRouter.of(context).pop(list[index]),
          child: ProfileItem(
            profile: list[index],
          ),
        ),
      ),
    );
  }
}
