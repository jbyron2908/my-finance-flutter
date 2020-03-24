import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repo_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/screen/home/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/home/widget/view.dart';

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
