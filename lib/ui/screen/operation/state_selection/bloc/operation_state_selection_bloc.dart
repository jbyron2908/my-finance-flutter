import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class OperationStateSelectionBloc extends BaseBloc {
  static OperationStateSelectionBloc of(BuildContext context) =>
      Provider.of<OperationStateSelectionBloc>(context, listen: false);

  OperationStateSelectionBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
