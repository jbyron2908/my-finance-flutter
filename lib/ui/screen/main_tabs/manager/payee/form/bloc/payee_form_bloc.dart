import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/provider/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/bloc/payee_form_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class PayeeFormBloc extends BaseBloc {
  static PayeeFormBloc of(BuildContext context) =>
      Provider.of<PayeeFormBloc>(context, listen: false);

  PayeeFormViewModel _viewModel;
  PayeeRepository _payeeRepository;

  final BuildContext context;
  final formKey = GlobalKey<FormState>();

  PayeeFormBloc(
    this.context, {
    PayeeModel payee,
  }) {
    _payeeRepository = PayeeRepository.of(context);
    _viewModel = PayeeFormViewModel(payee);
  }

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _payeeRepository.save(_viewModel.payee);
      MainTabRouter.of(context).pop();
    }
  }

  void cancel() async {
    MainTabRouter.of(context).pop();
  }

  @override
  List<SingleChildWidget> get dependencies => [
        ChangeNotifierProvider.value(
          value: _viewModel,
        )
      ];
}
