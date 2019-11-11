import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class OperationListBloc extends BaseBloc {
  static OperationListBloc of(BuildContext context) =>
      Provider.of<OperationListBloc>(context);

  OperationListBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
