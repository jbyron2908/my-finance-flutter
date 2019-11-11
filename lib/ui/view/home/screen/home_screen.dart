import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/home/screen/home_bloc.dart';
import 'package:my_finance_flutter/ui/view/home/widget/home_view.dart';

class HomeScreen extends BaseScreen<HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return HomeView();
  }

  @override
  HomeBloc buildBloc(BuildContext context) {
    return HomeBloc(
      gitRepoRepository: GitRepoRepository.of(context),
    );
  }
}
