import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class OperationStateSelectionBloc extends BaseBloc {
  static OperationStateSelectionBloc of(BuildContext context) =>
      Provider.of<OperationStateSelectionBloc>(context);

  OperationStateSelectionBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];

}
