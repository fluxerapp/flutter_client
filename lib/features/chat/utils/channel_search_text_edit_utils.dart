import 'package:material_ui/material_ui.dart';

class SearchTextEditResult {
  const SearchTextEditResult({required this.text, required this.cursor});

  final String text;
  final int cursor;
}

SearchTextEditResult replaceCurrentWordInSearchText({
  required String text,
  required int cursor,
  required String replacement,
}) {
  final int clampedCursor = cursor.clamp(0, text.length);
  final String textBeforeCursor = text.substring(0, clampedCursor);
  final String textAfterCursor = text.substring(clampedCursor);
  final List<String> words = textBeforeCursor.split(RegExp(r'\s+'));
  final String currentWord = words.isEmpty ? '' : words.last;
  final int lastWordStart = textBeforeCursor.length - currentWord.length;
  final String newText =
      '${textBeforeCursor.substring(0, lastWordStart)}$replacement$textAfterCursor';
  return SearchTextEditResult(
    text: newText,
    cursor: lastWordStart + replacement.length,
  );
}

void pruneSearchHintMaps({
  required String query,
  required Map<String, String> usersByTag,
  required Map<String, String> channelsByName,
}) {
  usersByTag.removeWhere((String tag, String _) {
    return !_queryContainsHintToken(query, tag);
  });
  channelsByName.removeWhere((String name, String _) {
    return !_queryContainsHintToken(query, name);
  });
}

bool _queryContainsHintToken(String query, String token) {
  if (token.isEmpty) {
    return false;
  }
  if (token.contains(' ')) {
    return query.contains('"$token"') || query.contains(token);
  }
  final RegExp pattern = RegExp(
    r'(?:^|\s)(?:from|mentions|in|-from|-mentions|-in):'
    '(?:"'
    '${RegExp.escape(token)}'
    '"|'
    '${RegExp.escape(token)}'
    r')(?=\s|$)',
    caseSensitive: false,
  );
  return pattern.hasMatch(query);
}

void applySearchTextEdit(
  TextEditingController controller, {
  required String replacement,
}) {
  final SearchTextEditResult result = replaceCurrentWordInSearchText(
    text: controller.text,
    cursor: controller.selection.baseOffset,
    replacement: replacement,
  );
  controller.value = TextEditingValue(
    text: result.text,
    selection: TextSelection.collapsed(offset: result.cursor),
  );
}
