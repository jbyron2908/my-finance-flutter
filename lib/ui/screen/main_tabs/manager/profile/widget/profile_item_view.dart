import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';

class ProfileItemView extends StatelessWidget {
  const ProfileItemView({
    Key key,
    this.profile,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final ProfileModel profile;
  final Function() onTap;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(profile.name),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}
