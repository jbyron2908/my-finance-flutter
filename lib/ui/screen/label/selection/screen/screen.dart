import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/label/selection/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/label/selection/widget/view.dart';
import 'package:my_finance_flutter/ui/screen/label/widgets/item.dart';
import 'package:provider/provider.dart';

class LabelSelectionScreen extends BaseScreen<LabelSelectionBloc> {
  LabelSelectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LabelSelectionView();
  }

  @override
  LabelSelectionBloc buildBloc(BuildContext context) {
    return LabelSelectionBloc();
  }
}

class _LabelList extends StatefulWidget {
  _LabelList({Key key}) : super(key: key);

  @override
  __LabelListState createState() => __LabelListState();
}

class __LabelListState extends State<_LabelList> {
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
