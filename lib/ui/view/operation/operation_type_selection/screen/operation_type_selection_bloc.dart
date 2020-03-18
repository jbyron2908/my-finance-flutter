import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class OperationTypeSelectionBloc extends BaseBloc {
  static OperationTypeSelectionBloc of(BuildContext context) =>
      Provider.of<OperationTypeSelectionBloc>(context, listen: false);

  OperationTypeSelectionBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
