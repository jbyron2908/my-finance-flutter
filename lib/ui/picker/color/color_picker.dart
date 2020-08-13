import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/constants/color/color.dart';

class ColorPicker extends StatelessWidget {
  static Future<Color> show(BuildContext context) async {
    return showDialog<Color>(
      context: context,
      builder: (context) => ColorPicker(ColorConstants.colorList),
      barrierDismissible: true,
    );
  }

  const ColorPicker(
    this.colorList, {
    Key key,
  }) : super(key: key);

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pick color'),
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            children: colorList
                .map(
                  (color) => ColorItem(color),
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

class ColorItem extends StatelessWidget {
  ColorItem(
    this.color, {
    Key key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      onTap: () => Navigator.pop(context, color),
    );
  }
}
