import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/provider.dart';

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
        ...bloc.dependencies,
      ],
      child: widget.build(context),
    );
  }
}
