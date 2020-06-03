import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/bloc/playground_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/screen/playground_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/widget/playground_view.dart';

class PlaygroundScreen extends BaseScreen<PlaygroundBloc, PlaygroundRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return PlaygroundView();
  }

  @override
  PlaygroundBloc buildBloc(BuildContext context) {
    return PlaygroundBloc(
      context: context,
    );
  }
}
