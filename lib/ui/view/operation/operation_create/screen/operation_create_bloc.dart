import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/operation_model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class OperationCreateBloc extends BaseBloc {
  static OperationCreateBloc of(BuildContext context) =>
      Provider.of<OperationCreateBloc>(context);

  final BuildContext context;
  final OperationRepository operationRepository;
  final OperationModel operation;

  GlobalKey<FormState> formKey;

  OperationCreateBloc({
    this.context,
    this.operationRepository,
    this.operation,
  });

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());
    formKey.currentState.save();
    await operationRepository.save(operation);
    Navigator.of(context).pop();
  }

  @override
  List<SingleChildCloneableWidget> get dependencies => [];
}
