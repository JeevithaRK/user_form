import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:readmore/readmore.dart';
import 'package:user_form/main.dart';

void main() {
  group('User Form', () {
    //Title test
    testWidgets("Let's get started", (WidgetTester tester) async {
      await tester.pumpWidget(FormScreen());

      var textFind = find.text("Let's get started");

      expect(textFind, findsOneWidget);
    });

    //Scaffold test
    testWidgets('Scaffold Test', (WidgetTester tester) async {
      await tester.pumpWidget(FormScreen());
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    //Textfield tests
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

      var result = find.byKey(Key('email'));

      expect(result, findsOneWidget);
    });
  });

  //Radio Button Test
  testWidgets('Radio Button 1', (WidgetTester tester) async {
    await tester.pumpWidget(FormScreen());

    expect(find.byKey(Key('radiobutton1')), findsOneWidget);
  });

  testWidgets('Radio Button 2', (WidgetTester tester) async {
    await tester.pumpWidget(FormScreen());
    expect(find.byKey(Key('radiobutton2')), findsOneWidget);
  });

  //Date test
  testWidgets('Date Icon', (WidgetTester tester) async {
    await tester.pumpWidget(FormScreen());
    expect(find.byKey(Key('Date and Icon')), findsOneWidget);
  });

  //SizedBox Test
  testWidgets('SizedBox Test', (WidgetTester tester) async {
    await tester.pumpWidget(FormScreen());
    expect(find.byType(SizedBox), findsNWidgets(14));
  });

  //Checkbox and Readmore-Readless Test
  testWidgets('Test Check Box', (WidgetTester tester) async {
    await tester.pumpWidget(FormScreen());
    expect(find.byType(Checkbox), findsNWidgets(2));
    expect(find.byType(ReadMoreText), findsNWidgets(2));
    final finderShowMore = find.byWidgetPredicate(
        (widget) => widget is RichText && tapTextSpan(widget, "Read More"));

    final finderShowLess = find.byWidgetPredicate(
        (widget) => widget is RichText && tapTextSpan(widget, "Read Less"));

    expect(finderShowMore, findsNWidgets(2));
    expect(finderShowLess, findsNothing);
  });

  //Submit button test
  testWidgets('Submit button test', (WidgetTester tester) async {
    await tester.pumpWidget(FormScreen());
    expect(find.byKey(Key('Button')), findsOneWidget);
  });
}

bool tapTextSpan(RichText richText, String text) {
  final isTapped = !richText.text.visitChildren(
    (visitor) => findTextAndTap(visitor, text),
  );
  return isTapped;
}

bool findTextAndTap(InlineSpan visitor, String text) {
  if (visitor is TextSpan && visitor.text == text) {
    (visitor.recognizer as TapGestureRecognizer).onTap?.call();

    return false;
  }

  return true;
}
