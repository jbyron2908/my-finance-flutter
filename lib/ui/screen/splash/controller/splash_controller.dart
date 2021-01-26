import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/storage/client/storage_client.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_screen.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
    await StorageClient.instance.init();
    await MainScreen.replaceTo();
  }
}
