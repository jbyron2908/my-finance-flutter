import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/flavor/index.dart';
import 'package:my_finance_flutter/generated/i18n.dart';
import 'package:my_finance_flutter/ui/view/home/screen/home_bloc.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    I18n i18n = I18n.of(context);
    var bloc = HomeBloc.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(i18n.greetTo("Flutter")),
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
              child: Text("List Tags"),
              onPressed: () => bloc.goToTagList(context),
            ),
            RaisedButton(
              child: Text("Select Tags"),
              onPressed: () => bloc.goToTagListSelection(context),
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
