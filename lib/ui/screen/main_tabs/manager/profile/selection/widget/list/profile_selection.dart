import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/widget/list/profile_selection_item.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_list.dart';
import 'package:provider/provider.dart';

class ProfileSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<ProfileModel>>(
      builder: (_, list, child) => ItemList(
        modelList: list,
        itemBuilder: (context, model) => ProfileSelectionItem(profile: model),
      ),
    );
  }
}
