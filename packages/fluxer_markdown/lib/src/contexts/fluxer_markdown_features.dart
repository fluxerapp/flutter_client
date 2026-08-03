import 'package:flutter/foundation.dart';
import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';

@immutable
class FluxerMarkdownFeatures {
  const FluxerMarkdownFeatures({
    required this.allowAlerts,
    required this.allowBlockquotes,
    required this.allowChannelMentions,
    required this.allowCodeBlocks,
    required this.allowCommandMentions,
    required this.allowEveryoneMentions,
    required this.allowGuildNavigations,
    required this.allowHeadings,
    required this.allowJumboEmoji,
    required this.allowLists,
    required this.allowMultilineBlockquotes,
    required this.allowPlainInlineCode,
    required this.allowRoleMentions,
    required this.allowSpoilers,
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
        allowCommandMentions: true,
        allowEveryoneMentions: true,
        allowGuildNavigations: true,
        allowHeadings: true,
        allowJumboEmoji: true,
        allowLists: true,
        allowMultilineBlockquotes: true,
        allowPlainInlineCode: false,
        allowRoleMentions: true,
        allowSpoilers: true,
        allowSubtext: true,
        allowTables: true,
        allowUserMentions: true,
      ),
      FluxerMarkdownContext.restrictedInlineReply =>
        const FluxerMarkdownFeatures(
          allowAlerts: false,
          allowBlockquotes: false,
          allowChannelMentions: true,
          allowCodeBlocks: true,
          allowCommandMentions: true,
          allowEveryoneMentions: true,
          allowGuildNavigations: true,
          allowHeadings: false,
          allowJumboEmoji: false,
          allowLists: false,
          allowMultilineBlockquotes: false,
          allowPlainInlineCode: true,
          allowRoleMentions: true,
          allowSpoilers: true,
          allowSubtext: true,
          allowTables: false,
          allowUserMentions: true,
        ),
      FluxerMarkdownContext.restrictedUserBio => const FluxerMarkdownFeatures(
        allowAlerts: false,
        allowBlockquotes: true,
        allowChannelMentions: true,
        allowCodeBlocks: false,
        allowCommandMentions: true,
        allowEveryoneMentions: false,
        allowGuildNavigations: true,
        allowHeadings: false,
        allowJumboEmoji: false,
        allowLists: true,
        allowMultilineBlockquotes: true,
        allowPlainInlineCode: false,
        allowRoleMentions: false,
        allowSpoilers: true,
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
          allowCommandMentions: true,
          allowEveryoneMentions: true,
          allowGuildNavigations: true,
          allowHeadings: false,
          allowJumboEmoji: false,
          allowLists: true,
          allowMultilineBlockquotes: true,
          allowPlainInlineCode: false,
          allowRoleMentions: true,
          allowSpoilers: true,
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
          allowCommandMentions: true,
          allowEveryoneMentions: true,
          allowGuildNavigations: true,
          allowHeadings: true,
          allowJumboEmoji: false,
          allowLists: true,
          allowMultilineBlockquotes: true,
          allowPlainInlineCode: false,
          allowRoleMentions: true,
          allowSpoilers: true,
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
  final bool allowCommandMentions;
  final bool allowEveryoneMentions;
  final bool allowGuildNavigations;
  final bool allowHeadings;
  final bool allowJumboEmoji;
  final bool allowLists;
  final bool allowMultilineBlockquotes;
  final bool allowPlainInlineCode;
  final bool allowRoleMentions;
  final bool allowSpoilers;
  final bool allowSubtext;
  final bool allowTables;
  final bool allowUserMentions;

  bool get isRestrictedInlinePreview =>
      allowPlainInlineCode && !allowJumboEmoji && !allowBlockquotes;

  @override
  bool operator ==(Object other) =>
      other is FluxerMarkdownFeatures &&
      other.allowAlerts == allowAlerts &&
      other.allowBlockquotes == allowBlockquotes &&
      other.allowChannelMentions == allowChannelMentions &&
      other.allowCodeBlocks == allowCodeBlocks &&
      other.allowCommandMentions == allowCommandMentions &&
      other.allowEveryoneMentions == allowEveryoneMentions &&
      other.allowGuildNavigations == allowGuildNavigations &&
      other.allowHeadings == allowHeadings &&
      other.allowJumboEmoji == allowJumboEmoji &&
      other.allowLists == allowLists &&
      other.allowMultilineBlockquotes == allowMultilineBlockquotes &&
      other.allowPlainInlineCode == allowPlainInlineCode &&
      other.allowRoleMentions == allowRoleMentions &&
      other.allowSpoilers == allowSpoilers &&
      other.allowSubtext == allowSubtext &&
      other.allowTables == allowTables &&
      other.allowUserMentions == allowUserMentions;

  @override
  int get hashCode => Object.hash(
    allowAlerts,
    allowBlockquotes,
    allowChannelMentions,
    allowCodeBlocks,
    allowCommandMentions,
    allowEveryoneMentions,
    allowGuildNavigations,
    allowHeadings,
    allowJumboEmoji,
    allowLists,
    allowMultilineBlockquotes,
    allowPlainInlineCode,
    allowRoleMentions,
    allowSpoilers,
    allowSubtext,
    allowTables,
    allowUserMentions,
  );
}
