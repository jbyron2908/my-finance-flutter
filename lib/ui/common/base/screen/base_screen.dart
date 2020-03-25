import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/provider.dart';

abstract class BaseScreen<BB extends BaseBloc, BA> extends StatefulWidget {
  BaseScreen({Key key}) : super(key: key);

  BB buildBloc(BuildContext context);
  Widget build(BuildContext context);

  @override
  _BaseScreenState createState() => _BaseScreenState<BB, BA>();
}

class _BaseScreenState<BB extends BaseBloc, BA> extends State<BaseScreen> {
  BB bloc;
  BA argument;

  @override
  Widget build(BuildContext context) {
    bloc ??= widget.buildBloc(context);
    argument ??= ModalRoute.of(context).settings.arguments;

    return MultiProvider(
      providers: [
        Provider.value(value: bloc),
        if (argument != null) Provider.value(value: argument),
        ...bloc.dependencies,
      ],
      child: widget.build(context),
    );
  }
}
