import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_item.dart';
import 'package:provider/provider.dart';

class OperationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<List<OperationModel>>(
        builder: (_, operationList, child) {
          if (operationList == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              itemCount: operationList.length,
              itemBuilder: (context, index) => OperationItem(
                operation: operationList[index],
              ),
            );
          }
        },
      ),
    );
  }
}
