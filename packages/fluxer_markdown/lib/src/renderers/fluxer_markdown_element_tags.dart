/// Element tag names shared between the renderer and the native AST bridge
/// in `package:fluxer_markdown_native` (`markdown_bridge.dart`).
abstract final class FluxerMarkdownElementTags {
  static const String underline = 'underline';
  static const String spoiler = 'spoiler';
  static const String emojiUnicode = 'emoji-unicode';
  static const String emojiCustom = 'emoji-custom';
  static const String jumpLink = 'jump-link';
  static const String mentionUser = 'mention-user';
  static const String mentionChannel = 'mention-channel';
  static const String mentionRole = 'mention-role';
  static const String mentionEveryone = 'mention-everyone';
  static const String mentionCommand = 'mention-command';
  static const String mentionGuildNav = 'mention-guild-nav';
  static const String timestamp = 'timestamp';
  static const String alert = 'alert';
  static const String subtext = 'subtext';
  static const String blockSpoiler = 'block-spoiler';
}

const int kFluxerMarkdownMaxListNestingDepth = 9;
