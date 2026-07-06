import 'package:flutter/widgets.dart';

enum FluxerGuildNavigationType { customize, browse, guide, linkedRoles }

FluxerGuildNavigationType? parseFluxerGuildNavigationType(String raw) {
  return switch (raw) {
    'customize' => FluxerGuildNavigationType.customize,
    'browse' => FluxerGuildNavigationType.browse,
    'guide' => FluxerGuildNavigationType.guide,
    'linked-roles' => FluxerGuildNavigationType.linkedRoles,
    _ => null,
  };
}

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
typedef FluxerCommandMentionBuilder =
    Widget Function(
      BuildContext context,
      String command,
      String applicationId,
      TextStyle style,
    );
typedef FluxerGuildNavigationMentionBuilder =
    Widget Function(
      BuildContext context,
      FluxerGuildNavigationType type,
      String? navigationId,
      TextStyle style,
    );
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
typedef FluxerSpoilerSyncKeyNormalizer = String? Function(String raw);
typedef FluxerCodeCopyHandler =
    void Function(BuildContext context, String code);

class FluxerSpoilerSyncController extends ChangeNotifier {
  final Set<String> _revealedKeys = <String>{};

  bool isRevealed(Iterable<String> keys) {
    for (final key in keys) {
      if (_revealedKeys.contains(key)) {
        return true;
      }
    }
    return false;
  }

  void reveal(Iterable<String> keys) {
    var changed = false;
    for (final key in keys) {
      if (key.isEmpty) {
        continue;
      }
      changed = _revealedKeys.add(key) || changed;
    }
    if (changed) {
      notifyListeners();
    }
  }
}

class FluxerMarkdownConfig {
  const FluxerMarkdownConfig({
    required this.resolveEmojiShortcode,
    required this.unicodeEmojiUrlBuilder,
    required this.customEmojiUrlBuilder,
    this.unicodeEmojiPattern,
    this.linkColor,
    this.blockquoteBorderColor,
    this.blockquoteTextColor,
    this.inlineCodeBackgroundColor,
    this.inlineCodeTextColor,
    this.spoilerBackgroundColor,
    this.internalLinkPattern,
    this.userMentionBuilder,
    this.channelMentionBuilder,
    this.roleMentionBuilder,
    this.everyoneMentionBuilder,
    this.commandMentionBuilder,
    this.guildNavigationMentionBuilder,
    this.linkWidgetBuilder,
    this.onTapLink,
    this.alertBuilder,
    this.spoilersInitiallyRevealed = false,
    this.spoilerSyncController,
    this.spoilerSyncKeyNormalizer,
    this.onCopyCode,
  });

  final FluxerShortcodeResolver resolveEmojiShortcode;
  final FluxerUnicodeEmojiUrlBuilder unicodeEmojiUrlBuilder;
  final FluxerCustomEmojiUrlBuilder customEmojiUrlBuilder;
  final RegExp? unicodeEmojiPattern;
  final Color? linkColor;
  final Color? blockquoteBorderColor;
  final Color? blockquoteTextColor;
  final Color? inlineCodeBackgroundColor;
  final Color? inlineCodeTextColor;
  final Color? spoilerBackgroundColor;
  final RegExp? internalLinkPattern;
  final FluxerMentionBuilder? userMentionBuilder;
  final FluxerMentionBuilder? channelMentionBuilder;
  final FluxerMentionBuilder? roleMentionBuilder;
  final FluxerEveryoneMentionBuilder? everyoneMentionBuilder;
  final FluxerCommandMentionBuilder? commandMentionBuilder;
  final FluxerGuildNavigationMentionBuilder? guildNavigationMentionBuilder;
  final FluxerLinkWidgetBuilder? linkWidgetBuilder;
  final FluxerLinkTapHandler? onTapLink;
  final FluxerAlertBuilder? alertBuilder;
  final bool spoilersInitiallyRevealed;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final FluxerSpoilerSyncKeyNormalizer? spoilerSyncKeyNormalizer;
  final FluxerCodeCopyHandler? onCopyCode;
}
