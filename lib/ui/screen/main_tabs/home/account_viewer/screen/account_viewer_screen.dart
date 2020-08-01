import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/bloc/account_viewer_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/account_viewer_view.dart';

class AccountViewerScreen
    extends BaseScreen<AccountViewerBloc, AccountViewerRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return AccountViewerView();
  }

  @override
  AccountViewerBloc buildBloc(BuildContext context) {
    return AccountViewerBloc(
      context: context,
      account: getArgument(context).account,
      operationRepository: OperationRepository.of(context),
    );
  }
}
