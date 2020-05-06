import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Category list test', (WidgetTester tester) async {
    // await tester.pumpWidget(CategoryListMock());
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
      ),
    );

    expect(find.text('1'), findsOneWidget);
  });
}
