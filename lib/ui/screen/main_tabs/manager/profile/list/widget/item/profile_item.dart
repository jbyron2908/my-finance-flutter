import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/widget/item/profile_actions.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/widget/item/profile_view.dart';
import 'package:provider/provider.dart';

class ProfileItem extends StatelessWidget {
  static ProfileModel profileOf(BuildContext context) =>
      Provider.of<ProfileModel>(context, listen: false);

  ProfileItem({
    Key key,
    this.profile,
  }) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: profile,
      child: ProfileActions(
        child: ProfileView(),
      ),
    );
  }
}
