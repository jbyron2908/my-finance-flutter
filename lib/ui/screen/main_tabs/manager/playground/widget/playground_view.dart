import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/ui/widgets/picker/color/color_picker.dart';
import 'package:my_finance_flutter/ui/widgets/picker/icon/icon_picker.dart';

class PlaygroundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () => openColorPicker(context),
              child: Text('Open color picker'),
            ),
            RaisedButton(
              onPressed: () => openIconPicker(context),
              child: Text('Open icon picker'),
            ),
          ],
        ),
      ),
    );
  }

  void openColorPicker(BuildContext context) async {
    var color = await ColorPicker.show(context);
    Log.i(color);
  }

  void openIconPicker(BuildContext context) async {
    var icon = await IconPicker.show(context);
    Log.i(icon);
  }
}
