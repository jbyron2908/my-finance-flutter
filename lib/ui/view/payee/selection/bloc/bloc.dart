import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class PayeeSelectionBloc extends BaseBloc {
  static PayeeSelectionBloc of(BuildContext context) =>
      Provider.of<PayeeSelectionBloc>(context, listen: false);

  PayeeSelectionBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
