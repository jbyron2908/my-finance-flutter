import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/debug_tools/controller/debug_tools_controller.dart';

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

class ListRow extends StatelessWidget {
  const ListRow({
    Key key,
    @required this.onTap,
    this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final void Function() onTap;
  final Widget title;
  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        title: title,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0, color: Colors.grey),
        ),
      ),
    );
  }
}
