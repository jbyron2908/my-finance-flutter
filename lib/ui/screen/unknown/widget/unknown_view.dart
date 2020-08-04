import 'package:flutter/material.dart';

class UnknownView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unknown route'),
      ),
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
