import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/screen/account_selection_bloc.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/widgets/account_selection_view.dart';

class AccountSelectionScreen extends BaseScreen<AccountSelectionBloc> {
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
