import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/icon/icon_model.dart';

class CircleIcon extends StatelessWidget {
  CircleIcon(
    this.iconModel, {
    Key key,
    this.circleSize = 40,
    this.iconSize = 32,
  }) : super(key: key);

  final IconModel iconModel;
  final double circleSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    var iconData = iconModel.iconData;
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        color: iconModel.circleColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        size: iconSize,
        color: iconModel.iconColor,
      ),
    );
  }
}
