import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/repository/git_repo/git_repo_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/bloc/entity_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/screen/entity_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/widget/entity_list_view.dart';

class EntityListScreen extends BaseScreen<EntityListBloc, EntityListRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return EntityListView();
  }

  @override
  EntityListBloc buildBloc(BuildContext context) {
    return EntityListBloc(
      gitRepoRepository: GitRepoRepository.of(context),
    );
  }
}
