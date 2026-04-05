import 'package:flutter/material.dart';

enum FluxerAlertType { note, tip, important, warning, caution }

FluxerAlertType? tryParseFluxerAlertType(String raw) {
  return switch (raw.toUpperCase()) {
    'NOTE' => FluxerAlertType.note,
    'TIP' => FluxerAlertType.tip,
    'IMPORTANT' => FluxerAlertType.important,
    'WARNING' => FluxerAlertType.warning,
    'CAUTION' => FluxerAlertType.caution,
    _ => null,
  };
}

typedef FluxerShortcodeResolver = String? Function(String name);
typedef FluxerUnicodeEmojiUrlBuilder = String? Function(String unicode);
typedef FluxerCustomEmojiUrlBuilder =
    String Function({
      required String id,
      required bool animated,
      required int size,
    });
typedef FluxerMentionBuilder =
    Widget Function(BuildContext context, String id, TextStyle style);
typedef FluxerEveryoneMentionBuilder =
    Widget Function(BuildContext context, String label, TextStyle style);
typedef FluxerLinkWidgetBuilder =
    Widget? Function(BuildContext context, String href, TextStyle style);
typedef FluxerLinkTapHandler =
    Future<void> Function(BuildContext context, String href);
typedef FluxerAlertBuilder =
    Widget Function(
      BuildContext context,
      FluxerAlertType type,
      Widget body,
      TextStyle baseStyle,
    );

class FluxerMarkdownConfig {
  const FluxerMarkdownConfig({
    required this.resolveEmojiShortcode,
    required this.unicodeEmojiUrlBuilder,
    required this.customEmojiUrlBuilder,
    this.linkColor,
    this.internalLinkPattern,
    this.userMentionBuilder,
    this.channelMentionBuilder,
    this.roleMentionBuilder,
    this.everyoneMentionBuilder,
    this.linkWidgetBuilder,
    this.onTapLink,
    this.alertBuilder,
  });

  final FluxerShortcodeResolver resolveEmojiShortcode;
  final FluxerUnicodeEmojiUrlBuilder unicodeEmojiUrlBuilder;
  final FluxerCustomEmojiUrlBuilder customEmojiUrlBuilder;
  final Color? linkColor;
  final RegExp? internalLinkPattern;
  final FluxerMentionBuilder? userMentionBuilder;
  final FluxerMentionBuilder? channelMentionBuilder;
  final FluxerMentionBuilder? roleMentionBuilder;
  final FluxerEveryoneMentionBuilder? everyoneMentionBuilder;
  final FluxerLinkWidgetBuilder? linkWidgetBuilder;
  final FluxerLinkTapHandler? onTapLink;
  final FluxerAlertBuilder? alertBuilder;
}
