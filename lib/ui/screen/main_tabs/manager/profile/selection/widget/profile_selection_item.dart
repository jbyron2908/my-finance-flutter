import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/widget/profile_item_view.dart';

class ProfileSelectionItem extends StatelessWidget {
  ProfileSelectionItem({
    Key key,
    this.profile,
  }) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return ProfileItemView(
      profile: profile,
      onTap: () => MainTabRouter.of(context).pop(profile),
    );
  }
}
