import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/account/create/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/account/create/widget/view.dart';

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
