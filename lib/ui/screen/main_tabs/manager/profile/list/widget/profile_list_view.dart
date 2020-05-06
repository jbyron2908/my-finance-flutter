import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/widget/profile_list_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/widget/profile_list.dart';

class ProfileListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
      ),
      body: Container(
        child: ProfileList(
          itemBuilder: (context, profile) => ProfileListItem(
            profile: profile,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToProfileForm(context),
      ),
    );
  }

  void _navigateToProfileForm(BuildContext context) {
    ProfileFormRoute(
      argument: ProfileFormScreenArgs.create(),
    ).navigateIntoTab(context);
  }
}
