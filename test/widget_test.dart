import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'category/list_mock.dart';

void main() {
  testWidgets('Category list test', (WidgetTester tester) async {
    // await tester.pumpWidget(CategoryListMock());
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: CategoryListMock(),
      ),
    );

    expect(find.text('1'), findsOneWidget);
  });
}
