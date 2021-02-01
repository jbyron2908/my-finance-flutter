import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/demo_populate_controller.dart';
import 'package:my_finance_flutter/ui/widgets/list/list_row.dart';

class DemoPopulateView extends StatelessWidget {
  final DemoPopulateController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Populate Demo'),
      ),
      body: ListView(
        children: [
          ListRow(
            title: Text('Clear entities'),
            leading: FaIcon(FontAwesomeIcons.clinicMedical),
            onTap: () => controller.onClearEntitiesTap(),
          ),
          ListRow(
            title: Text('Populate entities'),
            leading: FaIcon(FontAwesomeIcons.cloudMeatball),
            onTap: () => controller.onPopulateEntitiesTap(),
          ),
          ListRow(
            title: Text('Clear operations'),
            leading: FaIcon(FontAwesomeIcons.cloudMeatball),
            onTap: () => controller.onClearOperationsTap(),
          ),
          ListRow(
            title: Text('Populate operations'),
            leading: FaIcon(FontAwesomeIcons.cloudMeatball),
            onTap: () => controller.onPopulateAccountsTap(),
          ),
        ],
      ),
    );
  }
}
