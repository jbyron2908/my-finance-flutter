import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/git_repo/git_repo_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/bloc/entity_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/widget/entity_list_view.dart';
import 'package:provider/provider.dart';

class EntityListScreen
    extends BaseScreen<EntityListBloc, EntityListScreenArgs> {
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

class EntityListScreenArgs {
  static EntityListScreenArgs of(BuildContext context) =>
      Provider.of<EntityListScreenArgs>(context, listen: false);

  int field1;

  EntityListScreenArgs({
    this.field1,
  });
}
