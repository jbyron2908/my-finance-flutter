import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/bloc/profile_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/widget/profile_item_view.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_actions.dart';

class ProfileListItem extends StatelessWidget {
  ProfileListItem({
    Key key,
    this.profile,
  }) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return ItemActions(
      onDelete: () => _delete(context),
      onEdit: () => _edit(context),
      child: ProfileItemView(
        profile: profile,
      ),
    );
  }

  void _edit(BuildContext context) {
    final bloc = ProfileListBloc.of(context);
    bloc.editProfile(profile);
  }

  Future _delete(BuildContext context) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: 'Delete profile',
      content: 'Do you want to delete this profile?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    if (confirmation == true) {
      final bloc = ProfileListBloc.of(context);
      await bloc.deleteProfile(profile);
    }
  }
}
