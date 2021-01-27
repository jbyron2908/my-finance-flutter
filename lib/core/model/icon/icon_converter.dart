import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/icon/icon_model.dart';

class IconConverter {
  static String toEntity(IconModel model) {
    var map = model.toJson();
    return jsonEncode(map);
  }

  static IconModel toModel(String entity) {
    Map<String, dynamic> map = jsonDecode(entity);
    return IconModel.fromJson(map);
  }

  static IconModel fromIconAndColor({
    IconData icon,
    Color iconColor,
    Color circleColor,
  }) {
    return IconModel(
      iconCodePoint: icon.codePoint,
      iconFontFamily: icon.fontFamily,
      iconFontPackage: icon.fontPackage,
      iconColorCode: iconColor.value,
      circleColorCode: circleColor.value,
    );
  }
}
