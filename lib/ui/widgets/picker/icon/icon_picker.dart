import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/constants/icon/icon.dart';
import 'package:my_finance_flutter/core/model/icon/icon_model.dart';
import 'package:my_finance_flutter/ui/widgets/common/icon/circle_icon.dart';

class IconPicker extends StatelessWidget {
  static Future<IconData> show(BuildContext context) async {
    return showDialog<IconData>(
      context: context,
      builder: (context) => IconPicker(IconConstants.iconList),
      barrierDismissible: true,
    );
  }

  const IconPicker(
    this.colorList, {
    Key key,
  }) : super(key: key);

  final List<IconData> colorList;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pick icon'),
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 5,
            children: colorList
                .map(
                  (icon) => IconItem(icon),
                )
                .toList(),
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}

class IconItem extends StatelessWidget {
  IconItem(
    this.icon, {
    Key key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var iconModel = IconModel(
      circleColorCode: Colors.blue.value,
      iconColorCode: Colors.white.value,
      iconCodePoint: icon.codePoint,
      iconFontPackage: icon.fontPackage,
      iconFontFamily: icon.fontFamily,
    );
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleIcon(
          iconModel,
          circleSize: 60,
        ),
      ),
      onTap: () => Navigator.pop(context, icon),
    );
  }
}
