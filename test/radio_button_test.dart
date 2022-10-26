import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_form/main.dart';

void main() {
  group('Radio Buttons', () {
    testWidgets('Radio Button 1', (WidgetTester tester) async {
      await tester.pumpWidget(FormScreen());
      expect(find.byKey(Key('radiobutton1')), findsOneWidget);
    });

    testWidgets('Radio Button 2', (WidgetTester tester) async {
      await tester.pumpWidget(FormScreen());
      expect(find.byKey(Key('radiobutton2')), findsOneWidget);
    });
  });
}
