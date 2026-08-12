enum ChannelSearchSegmentType { text, filter, user, channel, date }

class ChannelSearchSegment {
  const ChannelSearchSegment({
    required this.type,
    required this.filterKey,
    required this.display,
    this.id,
    this.rawValue,
  });

  final ChannelSearchSegmentType type;
  final String filterKey;
  final String display;
  final String? id;
  final String? rawValue;
}

class ChannelSearchFilterOption {
  const ChannelSearchFilterOption({
    required this.key,
    required this.requiresValue,
    this.requiresGuild = false,
    this.values,
  });

  final String key;
  final bool requiresValue;
  final bool requiresGuild;
  final List<String>? values;

  String get syntaxLabel => '$key:';
}

const List<ChannelSearchFilterOption> kChannelSearchFilterOptions =
    <ChannelSearchFilterOption>[
      ChannelSearchFilterOption(key: 'from', requiresValue: true),
      ChannelSearchFilterOption(key: 'mentions', requiresValue: true),
      ChannelSearchFilterOption(
        key: 'has',
        requiresValue: true,
        values: <String>[
          'link',
          'embed',
          'file',
          'image',
          'video',
          'sound',
          'sticker',
          'poll',
          'forward',
        ],
      ),
      ChannelSearchFilterOption(key: 'before', requiresValue: true),
      ChannelSearchFilterOption(key: 'on', requiresValue: true),
      ChannelSearchFilterOption(key: 'during', requiresValue: true),
      ChannelSearchFilterOption(key: 'after', requiresValue: true),
      ChannelSearchFilterOption(
        key: 'in',
        requiresValue: true,
        requiresGuild: true,
      ),
      ChannelSearchFilterOption(
        key: 'pinned',
        requiresValue: true,
        values: <String>['true', 'false'],
      ),
      ChannelSearchFilterOption(
        key: 'author-type',
        requiresValue: true,
        values: <String>['user', 'bot', 'webhook'],
      ),
      ChannelSearchFilterOption(key: 'link-from', requiresValue: true),
      ChannelSearchFilterOption(key: 'file-name', requiresValue: true),
      ChannelSearchFilterOption(key: 'file-type', requiresValue: true),
      ChannelSearchFilterOption(
        key: 'sort',
        requiresValue: true,
        values: <String>['timestamp', 'relevance'],
      ),
      ChannelSearchFilterOption(
        key: 'order',
        requiresValue: true,
        values: <String>['asc', 'desc'],
      ),
    ];

const Map<String, String> kChannelSearchFilterKeyAliases = <String, String>{
  'link': 'link-from',
  'filename': 'file-name',
  'ext': 'file-type',
};

ChannelSearchFilterOption? channelSearchFilterOptionForKey(String key) {
  final bool negated = key.startsWith('-');
  final String normalizedKey = negated ? key.substring(1) : key;
  final String normalized =
      kChannelSearchFilterKeyAliases[normalizedKey] ?? normalizedKey;
  for (final ChannelSearchFilterOption option in kChannelSearchFilterOptions) {
    if (option.key == normalized) {
      if (negated && !_negatableChannelSearchFilterKeys.contains(option.key)) {
        return null;
      }
      return ChannelSearchFilterOption(
        key: negated ? '-${option.key}' : option.key,
        requiresValue: option.requiresValue,
        requiresGuild: option.requiresGuild,
        values: option.values,
      );
    }
  }
  return null;
}

const Set<String> _negatableChannelSearchFilterKeys = <String>{
  'from',
  'mentions',
  'has',
  'in',
  'link-from',
  'file-name',
  'file-type',
};

List<ChannelSearchFilterOption> channelSearchAutocompleteFilterOptions({
  required bool isGuildChannel,
  String currentWord = '',
}) {
  final bool negated = currentWord.startsWith('-');
  final String lookupWord = negated ? currentWord.substring(1) : currentWord;
  return kChannelSearchFilterOptions
      .where((ChannelSearchFilterOption option) {
        if (option.requiresGuild && !isGuildChannel) {
          return false;
        }
        if (negated &&
            !_negatableChannelSearchFilterKeys.contains(option.key)) {
          return false;
        }
        if (lookupWord.isEmpty) {
          return true;
        }
        final String syntax = negated
            ? '-${option.syntaxLabel}'
            : option.syntaxLabel;
        return syntax.contains(lookupWord) || option.key.contains(lookupWord);
      })
      .map((ChannelSearchFilterOption option) {
        if (!negated) {
          return option;
        }
        return ChannelSearchFilterOption(
          key: '-${option.key}',
          requiresValue: option.requiresValue,
          requiresGuild: option.requiresGuild,
          values: option.values,
        );
      })
      .toList();
}

bool isDateFilterKey(String key) =>
    key == 'before' || key == 'after' || key == 'on' || key == 'during';

bool isUserFilterKey(String key) {
  final String normalized = key.startsWith('-') ? key.substring(1) : key;
  return normalized == 'from' || normalized == 'mentions';
}

bool channelSearchFilterHasPredefinedValues(String key) =>
    channelSearchFilterOptionForKey(key)?.values != null;

String buildChannelSearchDisplayText(List<ChannelSearchSegment> segments) {
  final StringBuffer buffer = StringBuffer();
  for (final ChannelSearchSegment segment in segments) {
    if (segment.type == ChannelSearchSegmentType.text) {
      if (buffer.isNotEmpty &&
          segment.display.isNotEmpty &&
          !buffer.toString().endsWith(' ') &&
          !segment.display.startsWith(' ')) {
        buffer.write(' ');
      }
      buffer.write(segment.display);
      continue;
    }
    if (buffer.isNotEmpty && !buffer.toString().endsWith(' ')) {
      buffer.write(' ');
    }
    buffer.write('${segment.filterKey}:');
    if (segment.display.isNotEmpty) {
      final bool needsQuotes = segment.display.contains(' ');
      if (needsQuotes) {
        buffer.write('"${segment.display}"');
      } else {
        buffer.write(segment.display);
      }
    }
  }
  return buffer.toString();
}

List<ChannelSearchSegment> parseChannelSearchDisplayText(String text) {
  final List<ChannelSearchSegment> segments = <ChannelSearchSegment>[];
  final StringBuffer textBuffer = StringBuffer();
  int index = 0;
  while (index < text.length) {
    final int colonIndex = _findNextFilterColon(text, index);
    if (colonIndex == -1) {
      textBuffer.write(text.substring(index));
      break;
    }
    int wordStart = colonIndex - 1;
    while (wordStart >= index && text[wordStart] != ' ') {
      wordStart--;
    }
    wordStart++;
    if (wordStart > index) {
      textBuffer.write(text.substring(index, wordStart));
    }
    final String filterKey = _matchFilterKey(
      text.substring(wordStart, colonIndex).trim(),
    )!;
    if (textBuffer.isNotEmpty) {
      segments.add(
        ChannelSearchSegment(
          type: ChannelSearchSegmentType.text,
          filterKey: '',
          display: textBuffer.toString(),
        ),
      );
      textBuffer.clear();
    }
    index = colonIndex + 1;
    final (String value, int nextIndex) = _readFilterValue(text, index);
    index = nextIndex;
    segments.add(
      ChannelSearchSegment(
        type: isUserFilterKey(filterKey)
            ? ChannelSearchSegmentType.user
            : isDateFilterKey(filterKey)
            ? ChannelSearchSegmentType.date
            : filterKey == 'in'
            ? ChannelSearchSegmentType.channel
            : ChannelSearchSegmentType.filter,
        filterKey: filterKey,
        display: value,
        rawValue: value,
      ),
    );
  }
  if (textBuffer.isNotEmpty) {
    segments.add(
      ChannelSearchSegment(
        type: ChannelSearchSegmentType.text,
        filterKey: '',
        display: textBuffer.toString(),
      ),
    );
  }
  return segments;
}

int _findNextFilterColon(String text, int start) {
  for (int i = start; i < text.length; i++) {
    if (text[i] != ':') {
      continue;
    }
    int wordStart = i - 1;
    while (wordStart >= start && text[wordStart] != ' ') {
      wordStart--;
    }
    wordStart++;
    final String prefix = text.substring(wordStart, i).trim();
    if (_matchFilterKey(prefix) != null) {
      return i;
    }
  }
  return -1;
}

String? _matchFilterKey(String prefix) {
  final String trimmed = prefix.trim();
  final String? aliased = kChannelSearchFilterKeyAliases[trimmed];
  if (aliased != null) {
    return aliased;
  }
  for (final ChannelSearchFilterOption option in kChannelSearchFilterOptions) {
    if (option.key == trimmed) {
      return option.key;
    }
  }
  return null;
}

(String value, int nextIndex) _readFilterValue(String text, int start) {
  if (start >= text.length) {
    return ('', start);
  }
  if (text[start] == '"') {
    final int endQuote = text.indexOf('"', start + 1);
    if (endQuote == -1) {
      return (text.substring(start + 1), text.length);
    }
    return (text.substring(start + 1, endQuote), endQuote + 1);
  }
  final int spaceIndex = text.indexOf(' ', start);
  if (spaceIndex == -1) {
    return (text.substring(start), text.length);
  }
  return (text.substring(start, spaceIndex), spaceIndex + 1);
}
