import 'package:flutter/material.dart';

class UIHelper {
  static const double _spaceTiny = 4.0;
  static const double _spaceSmall = 8.0;
  static const double _spaceMedium = 16.0;
  static const double _spaceLarge = 32.0;

  static const Widget verticalSpaceTiny = SizedBox(
    height: _spaceTiny,
  );
  static const Widget verticalSpaceSmall = SizedBox(
    height: _spaceSmall,
  );
  static const Widget verticalSpaceMedium = SizedBox(
    height: _spaceMedium,
  );
  static const Widget verticalSpaceLarge = SizedBox(
    height: _spaceLarge,
  );

  static const Widget horizontalSpaceTiny = SizedBox(
    width: _spaceTiny,
  );
  static const Widget horizontalSpaceSmall = SizedBox(
    width: _spaceSmall,
  );
  static const Widget horizontalSpaceMedium = SizedBox(
    width: _spaceMedium,
  );
  static const Widget horizontalSpaceLarge = SizedBox(
    width: _spaceLarge,
  );
}
