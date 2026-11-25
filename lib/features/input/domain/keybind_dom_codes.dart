enum KeybindModifier { ctrl, alt, shift, meta }

const Map<KeybindModifier, (String, String)> kModifierDomCodes =
    <KeybindModifier, (String, String)>{
      KeybindModifier.ctrl: ('ControlLeft', 'ControlRight'),
      KeybindModifier.alt: ('AltLeft', 'AltRight'),
      KeybindModifier.shift: ('ShiftLeft', 'ShiftRight'),
      KeybindModifier.meta: ('MetaLeft', 'MetaRight'),
    };

const Map<String, String> _kPunctuationDomCodes = <String, String>{
  ' ': 'Space',
  '-': 'Minus',
  '_': 'Minus',
  '=': 'Equal',
  '+': 'Equal',
  ',': 'Comma',
  '<': 'Comma',
  '.': 'Period',
  '>': 'Period',
  ';': 'Semicolon',
  ':': 'Semicolon',
  "'": 'Quote',
  '"': 'Quote',
  '/': 'Slash',
  '?': 'Slash',
  r'\': 'Backslash',
  '|': 'Backslash',
  '[': 'BracketLeft',
  '{': 'BracketLeft',
  ']': 'BracketRight',
  '}': 'BracketRight',
  '`': 'Backquote',
  '~': 'Backquote',
};

final RegExp _letter = RegExp(r'^[A-Z]$');
final RegExp _digit = RegExp(r'^[0-9]$');

KeybindModifier? modifierForDomCode(String? code) {
  if (code == null) {
    return null;
  }
  for (final MapEntry<KeybindModifier, (String, String)> entry
      in kModifierDomCodes.entries) {
    if (entry.value.$1 == code || entry.value.$2 == code) {
      return entry.key;
    }
  }
  return null;
}

String? usLayoutKeyToDomCode(String key) {
  if (key.isEmpty) {
    return null;
  }
  if (key.length > 1) {
    return key;
  }
  final String? punctuation = _kPunctuationDomCodes[key];
  if (punctuation != null) {
    return punctuation;
  }
  final String upper = key.toUpperCase();
  if (_letter.hasMatch(upper)) {
    return 'Key$upper';
  }
  return _digit.hasMatch(upper) ? 'Digit$upper' : null;
}
