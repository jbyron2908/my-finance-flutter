import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/main/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/main/screen/route.dart';
import 'package:my_finance_flutter/ui/view/main/widget/view.dart';

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
