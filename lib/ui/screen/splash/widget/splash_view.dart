import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/storage/client/storage_client.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_route.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await StorageClient.instance.init();
      await MainRoute().replaceTo(context);
    });

    return Scaffold(
      body: Center(
        child: Text("MyFinance"),
      ),
    );
  }
}
