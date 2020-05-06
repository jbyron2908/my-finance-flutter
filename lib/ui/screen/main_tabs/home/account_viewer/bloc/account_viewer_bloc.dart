import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class AccountViewerBloc extends BaseBloc {
  static AccountViewerBloc of(BuildContext context) =>
      Provider.of<AccountViewerBloc>(context, listen: false);

  final BuildContext context;
  final AccountModel account;
  final OperationRepository operationRepository;

  AccountViewerBloc({
    @required this.context,
    @required this.account,
    @required this.operationRepository,
  });

  Future deleteOperation(OperationModel operation) async {
    return operationRepository.delete(operation);
  }

  @override
  List<SingleChildWidget> get dependencies => [
        StreamProvider<List<OperationModel>>.value(
          value: operationRepository.watchFilter(account.id),
          initialData: [],
        )
      ];
}
