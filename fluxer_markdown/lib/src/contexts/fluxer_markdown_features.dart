import 'package:fluxer_markdown/src/contexts/fluxer_markdown_context.dart';

class FluxerMarkdownFeatures {
  const FluxerMarkdownFeatures({
    required this.allowAutolinks,
    required this.allowAlerts,
    required this.allowBlockquotes,
    required this.allowChannelMentions,
    required this.allowCodeBlocks,
    required this.allowEveryoneMentions,
    required this.allowHeadings,
    required this.allowJumboEmoji,
    required this.allowLists,
    required this.allowRoleMentions,
    required this.allowSubtext,
    required this.allowTables,
    required this.allowUserMentions,
  });

  factory FluxerMarkdownFeatures.forContext(FluxerMarkdownContext context) {
    return switch (context) {
      FluxerMarkdownContext.standardWithJumbo => const FluxerMarkdownFeatures(
        allowAutolinks: true,
        allowAlerts: true,
        allowBlockquotes: true,
        allowChannelMentions: true,
        allowCodeBlocks: true,
        allowEveryoneMentions: true,
        allowHeadings: true,
        allowJumboEmoji: true,
        allowLists: true,
        allowRoleMentions: true,
        allowSubtext: true,
        allowTables: true,
        allowUserMentions: true,
      ),
      FluxerMarkdownContext.restrictedInlineReply =>
        const FluxerMarkdownFeatures(
          allowAutolinks: true,
          allowAlerts: false,
          allowBlockquotes: false,
          allowChannelMentions: true,
          allowCodeBlocks: false,
          allowEveryoneMentions: true,
          allowHeadings: false,
          allowJumboEmoji: false,
          allowLists: false,
          allowRoleMentions: true,
          allowSubtext: false,
          allowTables: false,
          allowUserMentions: true,
        ),
      FluxerMarkdownContext.restrictedUserBio =>
        const FluxerMarkdownFeatures(
          allowAutolinks: true,
          allowAlerts: false,
          allowBlockquotes: true,
          allowChannelMentions: true,
          allowCodeBlocks: false,
          allowEveryoneMentions: false,
          allowHeadings: false,
          allowJumboEmoji: false,
          allowLists: true,
          allowRoleMentions: false,
          allowSubtext: false,
          allowTables: false,
          allowUserMentions: true,
        ),
      FluxerMarkdownContext.restrictedEmbedDescription =>
        const FluxerMarkdownFeatures(
          allowAutolinks: false,
          allowAlerts: false,
          allowBlockquotes: true,
          allowChannelMentions: true,
          allowCodeBlocks: true,
          allowEveryoneMentions: true,
          allowHeadings: false,
          allowJumboEmoji: false,
          allowLists: true,
          allowRoleMentions: true,
          allowSubtext: true,
          allowTables: false,
          allowUserMentions: true,
        ),
      FluxerMarkdownContext.standardWithoutJumbo =>
        const FluxerMarkdownFeatures(
          allowAutolinks: true,
          allowAlerts: true,
          allowBlockquotes: true,
          allowChannelMentions: true,
          allowCodeBlocks: true,
          allowEveryoneMentions: true,
          allowHeadings: true,
          allowJumboEmoji: false,
          allowLists: true,
          allowRoleMentions: true,
          allowSubtext: true,
          allowTables: true,
          allowUserMentions: true,
        ),
    };
  }

  final bool allowAutolinks;
  final bool allowAlerts;
  final bool allowBlockquotes;
  final bool allowChannelMentions;
  final bool allowCodeBlocks;
  final bool allowEveryoneMentions;
  final bool allowHeadings;
  final bool allowJumboEmoji;
  final bool allowLists;
  final bool allowRoleMentions;
  final bool allowSubtext;
  final bool allowTables;
  final bool allowUserMentions;
}

