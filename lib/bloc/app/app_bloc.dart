import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:my_finance_flutter/bloc/app/bloc.dart';
import 'package:my_finance_flutter/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client.dart';
import 'package:my_finance_flutter/data_source/rest/client/rest_client.dart';
import 'package:my_finance_flutter/repository/repository_provider.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  MyFinanceDatabase _databaseClient = MyFinanceDatabase();
  MyFinanceGraphqlClient _graphqlClient = MyFinanceGraphqlClient();
  MyFinanceRestClient _restClient = MyFinanceRestClient();
  
  MyFinanceRepositoryProvider repositoryProvider = MyFinanceRepositoryProvider();

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
      await _databaseClient.setup();
      _graphqlClient.setup();
      _restClient.setup();
      repositoryProvider.setup(_graphqlClient, _restClient, _databaseClient);
      yield AppReadyState();
    }
  }
}
