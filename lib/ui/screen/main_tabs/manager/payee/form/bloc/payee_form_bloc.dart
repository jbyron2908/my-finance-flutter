import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class PayeeFormBloc extends BaseBloc {
  static PayeeFormBloc of(BuildContext context) =>
      Provider.of<PayeeFormBloc>(context, listen: false);

  PayeeFormBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
