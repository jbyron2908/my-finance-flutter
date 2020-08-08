import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_screen.dart';

class CategorySelectionController extends GetxController {
  CategorySelectionArg argument;

  void setArgument(CategorySelectionArg argument) {
    this.argument = argument;
  }
}
