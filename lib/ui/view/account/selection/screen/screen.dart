import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/account/selection/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/account/selection/widgets/view.dart';

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
