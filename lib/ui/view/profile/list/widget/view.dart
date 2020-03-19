import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/view/profile/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/profile/list/widget/list.dart';

class ProfileListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profiles"),
      ),
      body: Container(
        child: ProfileList(),
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
