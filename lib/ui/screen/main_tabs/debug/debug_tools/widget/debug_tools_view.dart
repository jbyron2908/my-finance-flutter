import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/debug_tools/controller/debug_tools_controller.dart';
import 'package:my_finance_flutter/ui/widgets/list/list_row.dart';

class DebugToolsView extends StatelessWidget {
  final DebugToolsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug tools'),
      ),
      body: ListView(
        children: [
          ListRow(
            title: Text('Populate Demo'),
            leading: FaIcon(FontAwesomeIcons.fire),
            onTap: () => controller.goToPopulateDemo(),
          ),
        ],
      ),
    );
  }
}
