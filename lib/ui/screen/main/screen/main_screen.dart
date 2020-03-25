import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main/bloc/main_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_view.dart';
import 'package:provider/provider.dart';

class MainScreen extends BaseScreen<MainBloc, MainScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return MainView();
  }

  @override
  MainBloc buildBloc(BuildContext context) {
    return MainBloc();
  }
}

class MainScreenArgs {
  static MainScreenArgs of(BuildContext context) =>
      Provider.of<MainScreenArgs>(context, listen: false);

  int field1;

  MainScreenArgs({
    this.field1,
  });
}
