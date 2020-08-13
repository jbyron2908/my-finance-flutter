import 'dart:convert';

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
}
