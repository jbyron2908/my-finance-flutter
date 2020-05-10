import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/bloc/account_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/widget/account_form_view.dart';

class AccountFormScreen
    extends BaseScreen<AccountFormBloc, AccountFormRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return AccountFormView();
  }

  @override
  AccountFormBloc buildBloc(BuildContext context) {
    var argument = getArgument(context);

    return AccountFormBloc(
      context,
      account: argument.account,
    );
  }
}
