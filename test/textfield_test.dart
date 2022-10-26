import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_form/main.dart';

void main() {
  group('Title and Text Field', () {
    testWidgets("Let's get started", (WidgetTester tester) async {
      await tester.pumpWidget(FormScreen());

      var textFind = find.text("Let's get started");

      expect(textFind, findsOneWidget);
    });

    testWidgets("PAN Number Textfield", (WidgetTester tester) async {
      await tester.pumpWidget(FormScreen());

      expect(find.byKey(Key('pan')), findsOneWidget);
    });

    testWidgets("First Name", (WidgetTester tester) async {
      await tester.pumpWidget(FormScreen());

      expect(find.byKey(Key('fname')), findsOneWidget);
    });

    testWidgets("Last Name", (WidgetTester tester) async {
      await tester.pumpWidget(FormScreen());

      expect(find.byKey(Key('lname')), findsOneWidget);
    });

    testWidgets("Email", (WidgetTester tester) async {
      await tester.pumpWidget(FormScreen());

      expect(find.byKey(Key('email')), findsOneWidget);
    });
  });
}
