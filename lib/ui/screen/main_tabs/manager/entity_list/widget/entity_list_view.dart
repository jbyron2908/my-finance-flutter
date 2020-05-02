import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/bloc/entity_list_bloc.dart';

class EntityListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = EntityListBloc.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Management"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Profiles"),
            leading: Icon(Icons.account_circle),
            onTap: () => bloc.goToProfileList(context),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Accounts"),
            leading: Icon(Icons.account_balance),
            onTap: () => bloc.goToAccountList(context),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Categories"),
            leading: Icon(Icons.category),
            onTap: () => bloc.goToCategoryList(context),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Payees"),
            leading: Icon(Icons.people),
            onTap: () => bloc.goToPayeeList(context),
          ),
        ],
      ),
    );
  }
}
