import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/icon/icon_model.dart';
import 'package:my_finance_flutter/core/repository/category/category_repository.dart';

class PopulateDemoController extends GetxController {
  final CategoryRepository _categoryRepository = Get.find();

  void onPopulateTap() {
    CategoryModel(
      name: 'Viagem',
      icon: IconModel(),
    );
  }
}
