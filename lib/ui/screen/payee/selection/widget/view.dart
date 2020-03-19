import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/payee/selection/widget/selection.dart';

class PayeeSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Payee"),
      ),
      body: Container(
        child: PayeeSelection(),
      ),
    );
  }
}
