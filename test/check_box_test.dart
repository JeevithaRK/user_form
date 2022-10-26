import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_form/main.dart';

void main() {
  testWidgets('Test Check Box', (WidgetTester tester) async {
    await tester.pumpWidget(FormScreen());
    expect(find.byType(Checkbox), findsNWidgets(2));
    final finderShowMore = find.byWidgetPredicate(
        (widget) => widget is RichText && tapTextSpan(widget, "Read More"));

    final finderShowLess = find.byWidgetPredicate(
        (widget) => widget is RichText && tapTextSpan(widget, "Read Less"));

    expect(finderShowMore, findsOneWidget);
    expect(finderShowLess, findsNothing);
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
