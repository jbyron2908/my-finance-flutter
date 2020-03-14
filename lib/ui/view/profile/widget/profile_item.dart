import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/profile_model.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem({Key key, this.profile}) : super(key: key);

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            profile.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
