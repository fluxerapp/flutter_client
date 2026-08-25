import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:material_ui/material_ui.dart' as flutter;

List<String> renderedTextContents(WidgetTester tester) {
  final List<String> results = <String>[];

  void add(String text) {
    if (text.trim().isNotEmpty) {
      results.add(text);
    }
  }

  for (final flutter.RichText richText in tester.widgetList(
    find.byWidgetPredicate((Widget widget) => widget is flutter.RichText),
  )) {
    add(richText.text.toPlainText());
  }

  for (final RichText richText in tester.widgetList(find.byType(RichText))) {
    add(richText.text.toPlainText());
  }

  for (final Text text in tester.widgetList(
    find.byWidgetPredicate(
      (Widget widget) => widget is Text && widget.textSpan != null,
    ),
  )) {
    add(text.textSpan!.toPlainText());
  }

  return results;
}

Finder findAppText(String data) {
  return find.byWidgetPredicate(
    (Widget widget) => widget is Text && widget.data == data,
  );
}

Finder findRenderedTextContaining(String text) {
  return find.byWidgetPredicate((Widget widget) {
    if (widget is RichText) {
      return widget.text.toPlainText().contains(text);
    }
    if (widget is flutter.RichText) {
      return widget.text.toPlainText().contains(text);
    }
    if (widget is Text && widget.textSpan != null) {
      return widget.textSpan!.toPlainText().contains(text);
    }
    return false;
  });
}

Finder findAppTextRichStartingWith(String text) {
  return find.byWidgetPredicate(
    (Widget widget) =>
        widget is Text &&
        widget.textSpan != null &&
        widget.textSpan!.toPlainText().startsWith(text),
  );
}

Finder findRenderedTextStartingWith(String text) {
  return find.byWidgetPredicate((Widget widget) {
    if (widget is RichText) {
      return widget.text.toPlainText().startsWith(text);
    }
    if (widget is flutter.RichText) {
      return widget.text.toPlainText().startsWith(text);
    }
    if (widget is Text && widget.textSpan != null) {
      return widget.textSpan!.toPlainText().startsWith(text);
    }
    return false;
  });
}
