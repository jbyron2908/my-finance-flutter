import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/widget/item/profile_item.dart';
import 'package:provider/provider.dart';

class ProfileSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<ProfileModel>>(
      builder: (_, list, child) => ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) => ProfileItem(
          profile: list[index],
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
