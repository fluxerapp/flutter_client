import 'package:flutter/rendering.dart' show SelectedContent;
import 'package:material_ui/material_ui.dart';

const int _kConcealedCodeUnit = 0xFDD0;
final String _kConcealedCharacter = String.fromCharCode(_kConcealedCodeUnit);

String stripConcealedSpoilerText(String text) {
  if (!text.contains(_kConcealedCharacter)) {
    return text;
  }
  return text.replaceAll(_kConcealedCharacter, '');
}

class ConcealedSpoilerTextSpan extends TextSpan {
  const ConcealedSpoilerTextSpan({
    required String super.text,
    super.style,
    super.recognizer,
    super.mouseCursor,
  });

  @override
  void computeToPlainText(
    StringBuffer buffer, {
    bool includeSemanticsLabels = true,
    bool includePlaceholders = true,
  }) {
    if (includeSemanticsLabels) {
      super.computeToPlainText(
        buffer,
        includeSemanticsLabels: includeSemanticsLabels,
        includePlaceholders: includePlaceholders,
      );
      return;
    }
    buffer.write(_kConcealedCharacter * text!.length);
  }
}

class ConcealedSpoilerSelectionScope extends StatefulWidget {
  const ConcealedSpoilerSelectionScope({required this.child, super.key});

  final Widget child;

  @override
  State<ConcealedSpoilerSelectionScope> createState() =>
      _ConcealedSpoilerSelectionScopeState();
}

class _ConcealedSpoilerSelectionScopeState
    extends State<ConcealedSpoilerSelectionScope> {
  final _ConcealedSpoilerSelectionDelegate _delegate =
      _ConcealedSpoilerSelectionDelegate();

  @override
  void dispose() {
    _delegate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (SelectionContainer.maybeOf(context) == null) {
      return widget.child;
    }
    return SelectionContainer(delegate: _delegate, child: widget.child);
  }
}

class _ConcealedSpoilerSelectionDelegate
    extends StaticSelectionContainerDelegate {
  @override
  SelectedContent? getSelectedContent() {
    final SelectedContent? content = super.getSelectedContent();
    if (content == null) {
      return null;
    }
    return SelectedContent(
      plainText: stripConcealedSpoilerText(content.plainText),
    );
  }
}
