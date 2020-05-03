import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/widget/item/profile_item.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profile = ProfileItem.profileOf(context);

    return Container(
      child: ListTile(
        title: Text(profile.name),
      ),
    );
  }
}
