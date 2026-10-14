import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_chip_filters.dart';

enum ChannelSearchTokenKind {
  from('from'),
  mentions('mentions'),
  channel('in'),
  has('has'),
  before('before'),
  during('during'),
  after('after'),
  pinned('pinned'),
  authorType('author-type');

  const ChannelSearchTokenKind(this.key);

  final String key;

  bool get isUser => this == from || this == mentions;

  bool get isDate => this == before || this == during || this == after;

  static ChannelSearchTokenKind? fromKey(String key) {
    final String normalized = key.trim().toLowerCase();
    if (normalized == 'on') {
      return ChannelSearchTokenKind.during;
    }
    for (final ChannelSearchTokenKind kind in values) {
      if (kind.key == normalized) {
        return kind;
      }
    }
    return null;
  }
}

@immutable
class ChannelSearchToken {
  const ChannelSearchToken({
    required this.kind,
    required this.value,
    this.label,
  });

  final ChannelSearchTokenKind kind;
  final String value;
  final String? label;

  String get signature => '${kind.key}:$value';

  Map<String, dynamic> toJson() => <String, dynamic>{
    'key': kind.key,
    'value': value,
    if (label != null) 'label': label,
  };

  static ChannelSearchToken? fromJson(Object? json) {
    if (json is! Map) {
      return null;
    }
    final Object? key = json['key'];
    final Object? value = json['value'];
    if (key is! String || value is! String || value.isEmpty) {
      return null;
    }
    final ChannelSearchTokenKind? kind = ChannelSearchTokenKind.fromKey(key);
    if (kind == null) {
      return null;
    }
    final Object? label = json['label'];
    return ChannelSearchToken(
      kind: kind,
      value: value,
      label: label is String && label.isNotEmpty ? label : null,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ChannelSearchToken && other.kind == kind && other.value == value;

  @override
  int get hashCode => Object.hash(kind, value);
}

List<ChannelSearchToken> dedupeChannelSearchTokens(
  Iterable<ChannelSearchToken> tokens,
) {
  final Map<String, ChannelSearchToken> bySignature =
      <String, ChannelSearchToken>{};
  for (final ChannelSearchToken token in tokens) {
    final ChannelSearchToken? existing = bySignature[token.signature];
    if (existing == null || (existing.label == null && token.label != null)) {
      bySignature[token.signature] = token;
    }
  }
  return bySignature.values.toList();
}

MessageSearchContentFilter? channelSearchContentFilterForValue(String value) {
  return switch (value.trim().toLowerCase()) {
    'image' => MessageSearchContentFilter.image,
    'video' => MessageSearchContentFilter.video,
    'sound' || 'audio' => MessageSearchContentFilter.audio,
    'file' => MessageSearchContentFilter.file,
    'link' => MessageSearchContentFilter.link,
    'embed' => MessageSearchContentFilter.embed,
    'sticker' => MessageSearchContentFilter.sticker,
    'poll' => MessageSearchContentFilter.poll,
    'snapshot' || 'forward' => MessageSearchContentFilter.forward,
    _ => null,
  };
}

ChannelSearchToken channelSearchHasToken(MessageSearchContentFilter filter) =>
    ChannelSearchToken(
      kind: ChannelSearchTokenKind.has,
      value: channelSearchHasValueForContentFilter(filter),
    );

String channelSearchTokenQueryValue(ChannelSearchToken token) {
  final String raw = switch (token.kind) {
    ChannelSearchTokenKind.from ||
    ChannelSearchTokenKind.mentions ||
    ChannelSearchTokenKind.channel => token.label ?? token.value,
    _ => token.value,
  };
  if (raw.contains(' ') || raw.contains(',') || raw.contains('"')) {
    return '"${raw.replaceAll('"', r'\"')}"';
  }
  return raw;
}

String serializeChannelSearchQuery({
  required String text,
  required Iterable<ChannelSearchToken> tokens,
}) {
  return <String>[
    for (final ChannelSearchToken token in tokens)
      '${token.kind.key}:${channelSearchTokenQueryValue(token)}',
    if (text.trim().isNotEmpty) text.trim(),
  ].join(' ');
}

String channelSearchQuerySignature({
  required String text,
  required Iterable<ChannelSearchToken> tokens,
}) {
  final List<String> parts =
      tokens.map((ChannelSearchToken token) => token.signature).toSet().toList()
        ..sort();
  return <String>[...parts, text.trim()].join('\u0000');
}
