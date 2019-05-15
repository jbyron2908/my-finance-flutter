import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:my_finance_flutter/bloc/app/bloc.dart';
import 'package:my_finance_flutter/data_source/db/config/database.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  Database database = Database();

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
      await database.setup();
      yield AppReadyState();
    }
  }
}
