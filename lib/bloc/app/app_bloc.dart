import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:my_finance_flutter/bloc/app/bloc.dart';
import 'package:my_finance_flutter/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client.dart';
import 'package:my_finance_flutter/data_source/rest/client/rest_client.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  MyFinanceDatabase databaseClient = MyFinanceDatabase();
  MyFinanceGraphqlClient graphqlClient = MyFinanceGraphqlClient();
  MyFinanceRestClient restClient = MyFinanceRestClient();

  @override
  AppState get initialState => AppInitState();

  void appStarted(){
    dispatch(AppStartedEvent());
  }

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      await databaseClient.setup();
      graphqlClient.setup();
      restClient.setup();
      yield AppReadyState();
    }
  }
}
