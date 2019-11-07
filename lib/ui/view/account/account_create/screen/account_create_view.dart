import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/screen/account_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/widget/account_create_form.dart';

class AccountCreateView extends BaseScreen<AccountCreateBloc> {
  AccountCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: AccountCreateForm(),
    );
  }

  @override
  AccountCreateBloc buildBloc(BuildContext context) {
    return AccountCreateBloc(
      accountRepository: AccountRepository.of(context),
    );
  }
}
