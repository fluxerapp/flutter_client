import 'package:flutter/services.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_chip_filters.dart'
    show ChannelSearchChipFilters;
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';
import 'package:fluxer_app/features/chat/utils/search/channel_search_utils.dart';

class ChannelSearchActiveFilter {
  const ChannelSearchActiveFilter({
    required this.kind,
    required this.query,
    required this.start,
    required this.end,
  });

  final ChannelSearchTokenKind kind;
  final String query;
  final int start;
  final int end;
}

const List<ChannelSearchTokenKind> kChannelSearchMenuFilters =
    <ChannelSearchTokenKind>[
      ChannelSearchTokenKind.from,
      ChannelSearchTokenKind.mentions,
      ChannelSearchTokenKind.has,
      ChannelSearchTokenKind.channel,
      ChannelSearchTokenKind.during,
      ChannelSearchTokenKind.before,
      ChannelSearchTokenKind.after,
      ChannelSearchTokenKind.pinned,
      ChannelSearchTokenKind.authorType,
    ];

List<ChannelSearchTokenKind> channelSearchMenuFilters({
  required bool isGuildChannel,
}) => kChannelSearchMenuFilters
    .where(
      (ChannelSearchTokenKind kind) =>
          isGuildChannel || kind != ChannelSearchTokenKind.channel,
    )
    .toList();

ChannelSearchActiveFilter? channelSearchActiveFilter(
  TextEditingValue value, {
  required bool isGuildChannel,
}) {
  final String text = value.text;
  final int cursor = value.selection.isValid
      ? value.selection.baseOffset.clamp(0, text.length)
      : text.length;
  final int start = text.lastIndexOf(' ', cursor == 0 ? 0 : cursor - 1) + 1;
  if (start > cursor) {
    return null;
  }
  final String word = text.substring(start, cursor);
  final int colon = word.indexOf(':');
  if (colon <= 0) {
    return null;
  }
  final ChannelSearchTokenKind? kind = ChannelSearchTokenKind.fromKey(
    word.substring(0, colon),
  );
  if (kind == null ||
      (kind == ChannelSearchTokenKind.channel && !isGuildChannel)) {
    return null;
  }
  int end = cursor;
  while (end < text.length && text[end] != ' ') {
    end++;
  }
  return ChannelSearchActiveFilter(
    kind: kind,
    query: text.substring(start + colon + 1, end),
    start: start,
    end: end,
  );
}

TextEditingValue channelSearchRemoveRange(
  TextEditingValue value,
  int start,
  int end,
) {
  final String before = value.text.substring(0, start).trimRight();
  final String after = value.text.substring(end).trimLeft();
  final String joined = before.isEmpty || after.isEmpty
      ? '$before$after'
      : '$before $after';
  final int offset = before.isEmpty ? 0 : before.length + 1;
  return TextEditingValue(
    text: joined,
    selection: TextSelection.collapsed(offset: offset.clamp(0, joined.length)),
  );
}

TextEditingValue channelSearchInsertFilterPrefix(
  TextEditingValue value,
  ChannelSearchTokenKind kind,
) {
  final ChannelSearchActiveFilter? active = channelSearchActiveFilter(
    value,
    isGuildChannel: true,
  );
  final TextEditingValue base = active == null
      ? value
      : channelSearchRemoveRange(value, active.start, active.end);
  final String text = base.text;
  final int cursor = base.selection.isValid
      ? base.selection.baseOffset.clamp(0, text.length)
      : text.length;
  final String before = text.substring(0, cursor);
  final String after = text.substring(cursor);
  final String prefix = before.isEmpty || before.endsWith(' ') ? '' : ' ';
  final String insert = '$prefix${kind.key}:';
  return TextEditingValue(
    text: '$before$insert$after',
    selection: TextSelection.collapsed(offset: before.length + insert.length),
  );
}

List<ChannelSearchToken> channelSearchAddToken(
  List<ChannelSearchToken> tokens,
  ChannelSearchToken token,
) {
  final bool singleValue =
      token.kind.isDate || token.kind == ChannelSearchTokenKind.pinned;
  return <ChannelSearchToken>[
    for (final ChannelSearchToken existing in tokens)
      if (existing != token && !(singleValue && existing.kind == token.kind))
        existing,
    token,
  ];
}

ChannelSearchChipFilters channelSearchChipFiltersForTokens(
  Iterable<ChannelSearchToken> tokens, {
  Iterable<ChannelSearchToken> extra = const <ChannelSearchToken>[],
}) {
  final List<ChannelSearchToken> all = <ChannelSearchToken>[
    ...tokens,
    ...extra,
  ];
  List<String> values(ChannelSearchTokenKind kind) => <String>{
    for (final ChannelSearchToken token in all)
      if (token.kind == kind) token.value,
  }.toList();
  final List<String> pinned = values(ChannelSearchTokenKind.pinned);
  return ChannelSearchChipFilters(
    authorIds: values(ChannelSearchTokenKind.from),
    mentionIds: values(ChannelSearchTokenKind.mentions),
    channelIds: values(ChannelSearchTokenKind.channel),
    contentTypes: <MessageSearchContentFilter>{
      for (final String value in values(ChannelSearchTokenKind.has))
        ?channelSearchContentFilterForValue(value),
    },
    pinned: pinned.isEmpty ? null : pinned.last == 'true',
    authorTypes: values(ChannelSearchTokenKind.authorType),
    dates: <(String, String)>[
      for (final ChannelSearchToken token in all)
        if (token.kind.isDate) (token.kind.key, token.value),
    ],
  );
}

List<MessageSearchContentFilter> channelSearchHasSuggestions(
  String query,
  String Function(MessageSearchContentFilter) label,
) {
  final String normalized = query.trim().toLowerCase();
  return kChannelSearchHasContentFilters.where((
    MessageSearchContentFilter filter,
  ) {
    if (normalized.isEmpty) {
      return true;
    }
    return label(filter).toLowerCase().contains(normalized) ||
        channelSearchHasValueForContentFilter(filter).contains(normalized) ||
        filter.name.contains(normalized);
  }).toList();
}

List<String> channelSearchValueSuggestions(
  ChannelSearchTokenKind kind,
  String query,
) {
  final List<String> values = switch (kind) {
    ChannelSearchTokenKind.pinned => const <String>['true', 'false'],
    ChannelSearchTokenKind.authorType => kChannelSearchAuthorTypeValues,
    _ => const <String>[],
  };
  final String normalized = query.trim().toLowerCase();
  return values
      .where((String value) => normalized.isEmpty || value.contains(normalized))
      .toList();
}

DateTime? channelSearchParseDate(String value) {
  final RegExpMatch? match = RegExp(
    r'^(\d{4})-(\d{1,2})-(\d{1,2})$',
  ).firstMatch(value.trim());
  if (match == null) {
    return null;
  }
  final int year = int.parse(match.group(1)!);
  final int month = int.parse(match.group(2)!);
  final int day = int.parse(match.group(3)!);
  final DateTime date = DateTime(year, month, day);
  if (date.year != year || date.month != month || date.day != day) {
    return null;
  }
  return date;
}
