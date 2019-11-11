import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/screen/account_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/widget/account_create_view.dart';

class AccountCreateScreen extends BaseScreen<AccountCreateBloc> {
  @override
  Widget build(BuildContext context) {
    return AccountCreateView();
  }

  @override
  AccountCreateBloc buildBloc(BuildContext context) {
    return AccountCreateBloc(
      accountRepository: AccountRepository.of(context),
    );
  }
}
