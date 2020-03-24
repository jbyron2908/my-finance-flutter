import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main/bloc/main_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_view.dart';

class MainScreen extends BaseScreen<MainBloc> {
  MainScreen(MainRouteArgs argument);

  @override
  Widget build(BuildContext context) {
    return MainView();
  }

  @override
  MainBloc buildBloc(BuildContext context) {
    return MainBloc();
  }
}
