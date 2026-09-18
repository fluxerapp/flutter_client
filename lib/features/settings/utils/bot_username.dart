const int kBotUsernameMinLength = 1;
const int kBotUsernameMaxLength = 32;
const String kExampleBotName = 'BotName';

final RegExp kBotUsernamePattern = RegExp(r'^[a-zA-Z0-9_]+$');

class BotUsernameRules {
  const BotUsernameRules({
    required this.validLength,
    required this.validCharacters,
  });

  final bool validLength;
  final bool validCharacters;
}

BotUsernameRules botUsernameRules(String username) {
  final String trimmed = username.trim();
  return BotUsernameRules(
    validLength:
        trimmed.length >= kBotUsernameMinLength &&
        trimmed.length <= kBotUsernameMaxLength,
    validCharacters: trimmed.isEmpty || kBotUsernamePattern.hasMatch(trimmed),
  );
}
