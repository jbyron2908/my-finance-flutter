import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/tag/selection/widget/selection.dart';

class TagSelectionView extends StatelessWidget {
  TagSelectionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Tag"),
      ),
      body: Container(
        child: TagSelection(),
      ),
    );
  }
}
