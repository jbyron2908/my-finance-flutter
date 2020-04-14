import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/provider.dart';

abstract class BaseWidget<BB extends BaseBloc> extends StatefulWidget {
  BaseWidget({Key key}) : super(key: key);

  BB buildBloc(BuildContext context);
  Widget build(BuildContext context);

  @override
  _BaseWidgetState createState() => _BaseWidgetState<BB>();
}

class _BaseWidgetState<BB extends BaseBloc> extends State<BaseWidget> {
  BB bloc;

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
