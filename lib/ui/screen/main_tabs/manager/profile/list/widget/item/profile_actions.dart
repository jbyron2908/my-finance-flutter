import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/bloc/profile_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/widget/item/profile_item.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.15,
        actions: <Widget>[
          SlideAction(
            child: ProfileActionLeft(),
          ),
        ],
        secondaryActions: <Widget>[
          SlideAction(
            child: ProfileActionRight(),
          ),
        ],
        child: child,
      ),
    );
  }
}

class ProfileActionRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Color(0xffE4A854),
        child: Icon(
          Icons.edit,
          color: Colors.white70,
        ),
        onPressed: () {
          Slidable.of(context).close();
          _edit(context);
        },
      ),
    );
  }

  _edit(BuildContext context) {
    final profile = ProfileItem.profileOf(context);
    final bloc = ProfileListBloc.of(context);
    bloc.editProfile(profile);
  }
}

class ProfileActionLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white70,
        ),
        onPressed: () async {
          await _delete(context);
          Slidable.of(context).close();
        },
      ),
    );
  }

  Future _delete(BuildContext context) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: "Delete profile",
      content: "Do you want to delete this profile?",
      confirmText: "Yes",
      cancelText: "No",
    );

    if (confirmation == true) {
      final profile = ProfileItem.profileOf(context);
      final bloc = ProfileListBloc.of(context);
      await bloc.deleteProfile(profile);
    }
  }
}
