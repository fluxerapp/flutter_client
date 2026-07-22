import 'dart:math' show sin;

const int kMessageListPlaceholderCozyGroups = 26;
const int kMessageListPlaceholderCompactGroups = 30;
const int kMessageListLoadingSkeletonGroups = 10;

class MessageListPlaceholderAttachment {
  const MessageListPlaceholderAttachment({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
}

class MessageListPlaceholderSpecs {
  const MessageListPlaceholderSpecs({
    required this.messageCounts,
    required this.attachmentSpecs,
    required this.groupSpacing,
    required this.totalHeight,
  });

  final List<int> messageCounts;
  final List<MessageListPlaceholderAttachment?> attachmentSpecs;
  final double groupSpacing;
  final double totalHeight;
}

MessageListPlaceholderSpecs buildMessageListPlaceholderSpecs({
  required String seedKey,
  required bool compact,
  required double groupSpacing,
  required double fontSize,
}) {
  final String resolvedSeedKey =
      '$seedKey|${compact ? '1' : '0'}|$groupSpacing|$fontSize';
  final int seed = _hashPlaceholderSeed(resolvedSeedKey);
  final int messageGroups = compact
      ? kMessageListPlaceholderCompactGroups
      : kMessageListPlaceholderCozyGroups;
  return _generatePlaceholderSpecs(
    compact: compact,
    messageGroups: messageGroups,
    groupRange: 4,
    attachments: 8,
    fontSize: fontSize,
    groupSpacing: groupSpacing,
    random: _createSeededRandom(seed),
  );
}

double messageListSkeletonWidthFactor(int seed) {
  final double x = sin(seed.toDouble()) * 10000;
  return x - x.floor();
}

int _hashPlaceholderSeed(String input) {
  int hash = 2166136261;
  for (int index = 0; index < input.length; index++) {
    hash ^= input.codeUnitAt(index);
    hash = (hash * 16777619) & 0xFFFFFFFF;
  }
  return hash;
}

double Function() _createSeededRandom(int seed) {
  int state = seed == 0 ? 0x9e3779b9 : seed;
  return () {
    state ^= state << 13;
    state ^= state >>> 17;
    state ^= state << 5;
    state &= 0xFFFFFFFF;
    return state / 4294967296;
  };
}

MessageListPlaceholderSpecs _generatePlaceholderSpecs({
  required bool compact,
  required int messageGroups,
  required int groupRange,
  required int attachments,
  required double fontSize,
  required double groupSpacing,
  required double Function() random,
}) {
  if (attachments > messageGroups) {
    throw ArgumentError(
      'Too many attachments for message groups: $messageGroups, $attachments',
    );
  }
  const double defaultFontSize = 16;
  const double cozyMessageHeight = 22;
  const double compactMessageHeight = 16;
  const double attachmentMargin = 8;
  final double scale = fontSize / defaultFontSize;
  final double messageHeight = compact
      ? compactMessageHeight
      : cozyMessageHeight;
  double totalHeight = 0;
  final List<int> messageCounts = <int>[];
  for (int index = 0; index < messageGroups; index++) {
    final int count = (random() * groupRange).floor() + 1;
    messageCounts.add(count);
    totalHeight += groupSpacing * scale;
    totalHeight += messageHeight * scale;
    totalHeight += (count - 1) * messageHeight * scale;
  }
  final List<int> availableGroupIndices = List<int>.generate(
    messageGroups,
    (int index) => index,
  );
  final List<MessageListPlaceholderAttachment?> attachmentSpecs =
      List<MessageListPlaceholderAttachment?>.filled(messageGroups, null);
  for (int index = 0; index < attachments; index++) {
    final int randomIndex = (random() * availableGroupIndices.length).floor();
    final int groupIndex = availableGroupIndices.removeAt(randomIndex);
    final double width = (random() * (400 - 140 + 1)).floor() + 140;
    final double height = (random() * (320 - 100 + 1)).floor() + 100;
    attachmentSpecs[groupIndex] = MessageListPlaceholderAttachment(
      width: width,
      height: height,
    );
    totalHeight += height + attachmentMargin * scale;
  }
  return MessageListPlaceholderSpecs(
    messageCounts: messageCounts,
    attachmentSpecs: attachmentSpecs,
    groupSpacing: groupSpacing,
    totalHeight: totalHeight,
  );
}
