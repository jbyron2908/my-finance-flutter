import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/view/profile/widget/profile_item.dart';
import 'package:provider/provider.dart';

class ProfileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<ProfileModel>>(
      builder: (_, list, child) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => ProfileItem(
          profile: list[index],
        ),
      ),
    );
  }
}
