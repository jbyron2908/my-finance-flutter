import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/widget/list/profile_selection.dart';

class ProfileSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profiles"),
      ),
      body: Container(
        child: ProfileSelection(),
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
