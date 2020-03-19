import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class PayeeCreateBloc extends BaseBloc {
  static PayeeCreateBloc of(BuildContext context) =>
      Provider.of<PayeeCreateBloc>(context, listen: false);

  PayeeCreateBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}