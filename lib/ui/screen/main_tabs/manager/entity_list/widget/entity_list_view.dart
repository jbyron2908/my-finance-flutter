import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/flavor/index.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/bloc/entity_list_bloc.dart';

class EntityListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = EntityListBloc.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Flavor.type.toString()),
            RaisedButton(
              child: Text("List Profiles"),
              onPressed: () => bloc.goToProfileList(context),
            ),
            RaisedButton(
              child: Text("List Accounts"),
              onPressed: () => bloc.goToAccountList(context),
            ),
            RaisedButton(
              child: Text("List Categories"),
              onPressed: () => bloc.goToCategoryList(context),
            ),
            RaisedButton(
              child: Text("List Operations"),
              onPressed: () => bloc.goToOperationList(context),
            ),
            RaisedButton(
              child: Text("List Payees"),
              onPressed: () => bloc.goToPayeeList(context),
            ),
            RaisedButton(
              child: Text("List Labels"),
              onPressed: () => bloc.goToLabelList(context),
            ),
            RaisedButton(
              child: Text("Select Labels"),
              onPressed: () => bloc.goToLabelListSelection(context),
            ),
            RaisedButton(
              child: Text("Import CSV"),
              onPressed: () => bloc.goToImportCsv(context),
            ),
            RaisedButton(
              child: Text("GraphQL Query"),
              onPressed: () => bloc.getRepositoriesGraphqlQuery(),
            ),
          ],
        ),
      ),
    );
  }
}
