import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/populate_demo/controller/populate_demo_controller.dart';

class PopulateDemoView extends StatelessWidget {
  final PopulateDemoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Populate Demo'),
      ),
      body: RaisedButton(
        child: Text('Tap here to populate'),
        onPressed: () => controller.onPopulateTap(),
      ),
    );
  }
}
