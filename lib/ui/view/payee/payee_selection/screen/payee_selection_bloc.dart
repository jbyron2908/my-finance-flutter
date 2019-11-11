import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class PayeeSelectionBloc extends BaseBloc {
  static PayeeSelectionBloc of(BuildContext context) =>
      Provider.of<PayeeSelectionBloc>(context);

  PayeeSelectionBloc();

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
