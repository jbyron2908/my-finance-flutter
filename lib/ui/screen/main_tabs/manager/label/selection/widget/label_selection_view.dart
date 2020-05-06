import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/widget/label_selection.dart';

class LabelSelectionView extends StatelessWidget {
  LabelSelectionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Label'),
      ),
      body: Container(
        child: LabelSelection(),
      ),
    );
  }
}
