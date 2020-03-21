import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/model.dart';
import 'package:my_finance_flutter/ui/screen/label/widgets/item.dart';
import 'package:provider/provider.dart';

class LabelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<LabelModel>>(
      builder: (_, labelList, child) => ListView.builder(
        itemCount: labelList.length,
        itemBuilder: (context, index) => LabelItem(
          label: labelList[index],
        ),
      ),
    );
  }
}
