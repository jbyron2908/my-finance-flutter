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
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListRow(
              title: Text('Populate Demo'),
              leading: Icon(FontAwesomeIcons.peopleArrows),
              trailing: Icon(FontAwesomeIcons.peopleArrows),
              onTap: () => controller.goToPopulateDemo(),
            ),
            ListRow(
              title: Text('Populate Demo'),
              leading: Icon(FontAwesomeIcons.peopleArrows),
              onTap: () => controller.goToPopulateDemo(),
            ),
          ],
        ).toList(),
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
          bottom: BorderSide(width: 0),
        ),
      ),
    );
  }
}
