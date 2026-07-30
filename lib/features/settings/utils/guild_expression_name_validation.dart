final RegExp _kEmojiNamePattern = RegExp(r'^[a-zA-Z0-9_]+$');

enum GuildExpressionNameValidationError { tooShort, tooLong, invalidCharacters }

GuildExpressionNameValidationError? validateGuildEmojiName(String name) {
  final String trimmed = name.trim();
  if (trimmed.length < 2) {
    return GuildExpressionNameValidationError.tooShort;
  }
  if (trimmed.length > 32) {
    return GuildExpressionNameValidationError.tooLong;
  }
  if (!_kEmojiNamePattern.hasMatch(trimmed)) {
    return GuildExpressionNameValidationError.invalidCharacters;
  }
  return null;
}

GuildExpressionNameValidationError? validateGuildStickerName(String name) {
  final String trimmed = name.trim();
  if (trimmed.isEmpty) {
    return GuildExpressionNameValidationError.tooShort;
  }
  if (trimmed.length < 2) {
    return GuildExpressionNameValidationError.tooShort;
  }
  if (trimmed.length > 30) {
    return GuildExpressionNameValidationError.tooLong;
  }
  return null;
}

String? validateGuildStickerDescription(String description) {
  if (description.length > 500) {
    return 'tooLong';
  }
  return null;
}

String deriveGuildEmojiNameFromFileName(String fileName) {
  final int dotIndex = fileName.lastIndexOf('.');
  final String baseName = dotIndex > 0
      ? fileName.substring(0, dotIndex)
      : fileName;
  final String sanitized = baseName
      .replaceAll(RegExp('[^a-zA-Z0-9_]'), '_')
      .replaceAll(RegExp('_+'), '_')
      .replaceAll(RegExp(r'^_+|_+$'), '');
  if (sanitized.length < 2) {
    return 'emoji';
  }
  if (sanitized.length > 32) {
    return sanitized.substring(0, 32);
  }
  return sanitized;
}
