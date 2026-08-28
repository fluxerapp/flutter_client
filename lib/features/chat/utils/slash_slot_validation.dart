enum SlashSlotValidationError {
  requiredValue,
  unknownUser,
  unknownRole,
  unknownChannel,
  notAnInteger,
  notANumber,
  notABoolean,
  invalidChoice,
}

class SlashSlotValidationResult {
  const SlashSlotValidationResult({
    required this.valid,
    this.resolvedWire,
    this.error,
  });

  final bool valid;
  final String? resolvedWire;
  final SlashSlotValidationError? error;
}

final RegExp _userWireRe = RegExp(r'^<@!?(\d+)>$');
final RegExp _roleWireRe = RegExp(r'^<@&(\d+)>$');
final RegExp _channelWireRe = RegExp(r'^<#(\d+)>$');
final RegExp _bareIdRe = RegExp(r'^\d+$');
final RegExp _integerRe = RegExp(r'^-?\d+$');
final RegExp _numberRe = RegExp(r'^-?\d+(\.\d+)?$');

String _stripLeadingSigil(String text, String sigil) {
  return text.startsWith(sigil) ? text.substring(sigil.length) : text;
}

SlashSlotValidationResult validateSlashSlot({
  required String optionType,
  required String rawText,
  required bool required,
  List<({String name, String value})> choices = const [],
  String? Function(String query)? resolveUser,
  String? Function(String query)? resolveChannel,
  String? Function(String query)? resolveRole,
}) {
  final String text = rawText.trim();
  if (text.isEmpty) {
    if (required) {
      return const SlashSlotValidationResult(
        valid: false,
        error: SlashSlotValidationError.requiredValue,
      );
    }
    return const SlashSlotValidationResult(valid: true);
  }

  switch (optionType) {
    case 'user':
      final RegExpMatch? wireMatch = _userWireRe.firstMatch(text);
      if (wireMatch != null) {
        return SlashSlotValidationResult(
          valid: true,
          resolvedWire: '<@${wireMatch.group(1)}>',
        );
      }
      if (_bareIdRe.hasMatch(text)) {
        return SlashSlotValidationResult(valid: true, resolvedWire: '<@$text>');
      }
      final String? resolved = resolveUser?.call(_stripLeadingSigil(text, '@'));
      if (resolved != null) {
        return SlashSlotValidationResult(
          valid: true,
          resolvedWire: '<@$resolved>',
        );
      }
      return const SlashSlotValidationResult(
        valid: false,
        error: SlashSlotValidationError.unknownUser,
      );
    case 'role':
      final RegExpMatch? wireMatch = _roleWireRe.firstMatch(text);
      if (wireMatch != null) {
        return SlashSlotValidationResult(
          valid: true,
          resolvedWire: '<@&${wireMatch.group(1)}>',
        );
      }
      if (_bareIdRe.hasMatch(text)) {
        return SlashSlotValidationResult(
          valid: true,
          resolvedWire: '<@&$text>',
        );
      }
      final String? resolved = resolveRole?.call(_stripLeadingSigil(text, '@'));
      if (resolved != null) {
        return SlashSlotValidationResult(
          valid: true,
          resolvedWire: '<@&$resolved>',
        );
      }
      return const SlashSlotValidationResult(
        valid: false,
        error: SlashSlotValidationError.unknownRole,
      );
    case 'channel':
      final RegExpMatch? wireMatch = _channelWireRe.firstMatch(text);
      if (wireMatch != null) {
        return SlashSlotValidationResult(
          valid: true,
          resolvedWire: '<#${wireMatch.group(1)}>',
        );
      }
      if (_bareIdRe.hasMatch(text)) {
        return SlashSlotValidationResult(valid: true, resolvedWire: '<#$text>');
      }
      final String? resolved = resolveChannel?.call(
        _stripLeadingSigil(text, '#'),
      );
      if (resolved != null) {
        return SlashSlotValidationResult(
          valid: true,
          resolvedWire: '<#$resolved>',
        );
      }
      return const SlashSlotValidationResult(
        valid: false,
        error: SlashSlotValidationError.unknownChannel,
      );
    case 'integer':
      if (!_integerRe.hasMatch(text)) {
        return const SlashSlotValidationResult(
          valid: false,
          error: SlashSlotValidationError.notAnInteger,
        );
      }
      return SlashSlotValidationResult(valid: true, resolvedWire: text);
    case 'number':
      if (!_numberRe.hasMatch(text)) {
        return const SlashSlotValidationResult(
          valid: false,
          error: SlashSlotValidationError.notANumber,
        );
      }
      return SlashSlotValidationResult(valid: true, resolvedWire: text);
    case 'boolean':
      final String lower = text.toLowerCase();
      if (lower != 'true' && lower != 'false') {
        return const SlashSlotValidationResult(
          valid: false,
          error: SlashSlotValidationError.notABoolean,
        );
      }
      return SlashSlotValidationResult(valid: true, resolvedWire: lower);
    case 'choice':
      for (final ({String name, String value}) choice in choices) {
        if (choice.value == text ||
            choice.name.toLowerCase() == text.toLowerCase()) {
          return SlashSlotValidationResult(
            valid: true,
            resolvedWire: choice.value,
          );
        }
      }
      return const SlashSlotValidationResult(
        valid: false,
        error: SlashSlotValidationError.invalidChoice,
      );
    default:
      return SlashSlotValidationResult(valid: true, resolvedWire: text);
  }
}
