import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/label/widgets/item.dart';
import 'package:provider/provider.dart';

class LabelSelection extends StatefulWidget {
  @override
  _LabelSelectionState createState() => _LabelSelectionState();
}

class _LabelSelectionState extends State<LabelSelection> {
  List<LabelModel> selectedLabelList = List();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Consumer<List<LabelModel>>(
            builder: (_, labelList, child) => ListView(
              shrinkWrap: true,
              children: <Widget>[
                ...labelList.map(
                  (item) => InkWell(
                    onTap: () => tapItem(item),
                    child: Container(
                      color: getColor(item),
                      child: LabelItem(
                        label: item,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpaceSmall,
          RaisedButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              AppRouter.pop(context, selectedLabelList);
            },
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Color getColor(LabelModel item) {
    return selectedLabelList.contains(item) ? Colors.green : Colors.transparent;
  }

  void tapItem(LabelModel item) {
    setState(() {
      selectedLabelList.contains(item)
          ? selectedLabelList.remove(item)
          : selectedLabelList.add(item);
    });
  }
}
