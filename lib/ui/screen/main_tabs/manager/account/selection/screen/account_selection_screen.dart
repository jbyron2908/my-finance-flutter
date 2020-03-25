import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/bloc/account_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/widgets/account_selection_view.dart';

class AccountSelectionScreen extends BaseScreen<AccountSelectionBloc> {
  AccountSelectionScreen(this.arguments);

  final AccountSelectionRouteArgs arguments;

  @override
  Widget build(BuildContext context) {
    return AccountSelectionView();
  }

  @override
  AccountSelectionBloc buildBloc(BuildContext context) {
    return AccountSelectionBloc(
      accountRepository: AccountRepository.of(context),
    );
  }
}
