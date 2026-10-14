import 'package:flutter/services.dart';
import 'package:fluxer_app/material_ui.dart';

class Utf16LengthLimitingTextInputFormatter extends TextInputFormatter {
  Utf16LengthLimitingTextInputFormatter(this.maxLength);

  final int maxLength;

  static String truncate(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    final StringBuffer buffer = StringBuffer();
    for (final String grapheme in text.characters) {
      if (buffer.length + grapheme.length > maxLength) {
        break;
      }
      buffer.write(grapheme);
    }
    return buffer.toString();
  }

  static bool _isHighSurrogate(int unit) => unit >= 0xD800 && unit <= 0xDBFF;

  static bool _isLowSurrogate(int unit) => unit >= 0xDC00 && unit <= 0xDFFF;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String next = newValue.text;
    if (next.length <= maxLength) {
      return newValue;
    }
    final String previous = oldValue.text;
    int prefix = 0;
    final int shortest = previous.length < next.length
        ? previous.length
        : next.length;
    while (prefix < shortest && previous[prefix] == next[prefix]) {
      prefix++;
    }
    int suffix = 0;
    while (suffix < shortest - prefix &&
        previous[previous.length - 1 - suffix] ==
            next[next.length - 1 - suffix]) {
      suffix++;
    }
    if (prefix > 0 && _isHighSurrogate(next.codeUnitAt(prefix - 1))) {
      prefix--;
    }
    if (suffix > 0 && _isLowSurrogate(next.codeUnitAt(next.length - suffix))) {
      suffix--;
    }
    final String inserted = next.substring(prefix, next.length - suffix);
    final int room = maxLength - (next.length - inserted.length);
    final String kept = room <= 0 ? '' : truncate(inserted, room);
    final String head = next.substring(0, prefix);
    final String tail = next.substring(next.length - suffix);
    final String limited = truncate('$head$kept$tail', maxLength);
    final int cursor = (head.length + kept.length).clamp(0, limited.length);
    return TextEditingValue(
      text: limited,
      selection: TextSelection.collapsed(offset: cursor),
    );
  }
}
