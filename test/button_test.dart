import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_form/main.dart';

void main() {
  testWidgets('Submit button test', (WidgetTester tester) async {
    await tester.pumpWidget(FormScreen());
    expect(find.byKey(Key('Button')), findsOneWidget);
  });
}
