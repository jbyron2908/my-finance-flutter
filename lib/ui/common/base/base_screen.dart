import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_bloc.dart';

abstract class BaseScreen<T extends BaseBloc> extends StatefulWidget {
  BaseScreen({Key key}) : super(key: key);

  T buildBloc(BuildContext context);
  Widget build(BuildContext context);

  @override
  _BaseScreenState createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends BaseBloc> extends State<BaseScreen> {
  T bloc;

  @override
  Widget build(BuildContext context) {
    bloc ??= widget.buildBloc(context);

    return MultiProvider(
      providers: [
        Provider.value(value: bloc),
        ...bloc.stateDependencies,
      ],
      child: widget.build(context),
    );
  }
}
