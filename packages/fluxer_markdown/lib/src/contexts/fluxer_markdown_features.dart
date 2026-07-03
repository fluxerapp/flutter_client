import 'package:flutter/foundation.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';

@immutable
class FluxerMarkdownFeatures {
  const FluxerMarkdownFeatures({
    required this.allowAlerts,
    required this.allowBlockquotes,
    required this.allowChannelMentions,
    required this.allowCodeBlocks,
    required this.allowEveryoneMentions,
    required this.allowHeadings,
    required this.allowJumboEmoji,
    required this.allowLists,
    required this.allowPlainInlineCode,
    required this.allowRoleMentions,
    required this.allowSubtext,
    required this.allowTables,
    required this.allowUserMentions,
  });

  factory FluxerMarkdownFeatures.forContext(FluxerMarkdownContext context) {
    return switch (context) {
      FluxerMarkdownContext.standardWithJumbo => const FluxerMarkdownFeatures(
        allowAlerts: true,
        allowBlockquotes: true,
        allowChannelMentions: true,
        allowCodeBlocks: true,
        allowEveryoneMentions: true,
        allowHeadings: true,
        allowJumboEmoji: true,
        allowLists: true,
        allowPlainInlineCode: false,
        allowRoleMentions: true,
        allowSubtext: true,
        allowTables: true,
        allowUserMentions: true,
      ),
      FluxerMarkdownContext.restrictedInlineReply =>
        const FluxerMarkdownFeatures(
          allowAlerts: false,
          allowBlockquotes: false,
          allowChannelMentions: true,
          allowCodeBlocks: false,
          allowEveryoneMentions: true,
          allowHeadings: false,
          allowJumboEmoji: false,
          allowLists: false,
          allowPlainInlineCode: true,
          allowRoleMentions: true,
          allowSubtext: false,
          allowTables: false,
          allowUserMentions: true,
        ),
      FluxerMarkdownContext.restrictedUserBio => const FluxerMarkdownFeatures(
        allowAlerts: false,
        allowBlockquotes: true,
        allowChannelMentions: true,
        allowCodeBlocks: false,
        allowEveryoneMentions: false,
        allowHeadings: false,
        allowJumboEmoji: false,
        allowLists: true,
        allowPlainInlineCode: false,
        allowRoleMentions: false,
        allowSubtext: false,
        allowTables: false,
        allowUserMentions: true,
      ),
      FluxerMarkdownContext.restrictedEmbedDescription =>
        const FluxerMarkdownFeatures(
          allowAlerts: false,
          allowBlockquotes: true,
          allowChannelMentions: true,
          allowCodeBlocks: true,
          allowEveryoneMentions: true,
          allowHeadings: false,
          allowJumboEmoji: false,
          allowLists: true,
          allowPlainInlineCode: false,
          allowRoleMentions: true,
          allowSubtext: true,
          allowTables: false,
          allowUserMentions: true,
        ),
      FluxerMarkdownContext.standardWithoutJumbo =>
        const FluxerMarkdownFeatures(
          allowAlerts: true,
          allowBlockquotes: true,
          allowChannelMentions: true,
          allowCodeBlocks: true,
          allowEveryoneMentions: true,
          allowHeadings: true,
          allowJumboEmoji: false,
          allowLists: true,
          allowPlainInlineCode: false,
          allowRoleMentions: true,
          allowSubtext: true,
          allowTables: true,
          allowUserMentions: true,
        ),
    };
  }

  final bool allowAlerts;
  final bool allowBlockquotes;
  final bool allowChannelMentions;
  final bool allowCodeBlocks;
  final bool allowEveryoneMentions;
  final bool allowHeadings;
  final bool allowJumboEmoji;
  final bool allowLists;
  final bool allowPlainInlineCode;
  final bool allowRoleMentions;
  final bool allowSubtext;
  final bool allowTables;
  final bool allowUserMentions;

  @override
  bool operator ==(Object other) =>
      other is FluxerMarkdownFeatures &&
      other.allowAlerts == allowAlerts &&
      other.allowBlockquotes == allowBlockquotes &&
      other.allowChannelMentions == allowChannelMentions &&
      other.allowCodeBlocks == allowCodeBlocks &&
      other.allowEveryoneMentions == allowEveryoneMentions &&
      other.allowHeadings == allowHeadings &&
      other.allowJumboEmoji == allowJumboEmoji &&
      other.allowLists == allowLists &&
      other.allowPlainInlineCode == allowPlainInlineCode &&
      other.allowRoleMentions == allowRoleMentions &&
      other.allowSubtext == allowSubtext &&
      other.allowTables == allowTables &&
      other.allowUserMentions == allowUserMentions;

  @override
  int get hashCode => Object.hash(
    allowAlerts,
    allowBlockquotes,
    allowChannelMentions,
    allowCodeBlocks,
    allowEveryoneMentions,
    allowHeadings,
    allowJumboEmoji,
    allowLists,
    allowPlainInlineCode,
    allowRoleMentions,
    allowSubtext,
    allowTables,
    allowUserMentions,
  );
}
