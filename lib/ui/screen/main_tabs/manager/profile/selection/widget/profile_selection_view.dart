import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/create/screen/profile_create_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/widget/profile_selection.dart';

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
        onPressed: () => _navigateToProfileCreate(context),
      ),
    );
  }

  void _navigateToProfileCreate(BuildContext context) {
    AppRouter.navigateTo(context, ProfileCreateRoute());
  }
}
