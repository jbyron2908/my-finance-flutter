import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/controller/entity_list_controller.dart';

class EntityListView extends StatelessWidget {
  final EntityListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Profiles'),
            leading: Icon(Icons.account_circle),
            onTap: () => controller.goToProfileList(),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Accounts'),
            leading: Icon(Icons.account_balance),
            onTap: () => controller.goToAccountList(),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Categories'),
            leading: Icon(Icons.category),
            onTap: () => controller.goToCategoryList(),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Payees'),
            leading: Icon(
              Icons.people,
            ),
            onTap: () => controller.goToPayeeList(),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Playground1'),
            leading: Icon(Icons.info),
            onTap: () => controller.goToPlayground(),
          ),
        ],
      ),
    );
  }
}
