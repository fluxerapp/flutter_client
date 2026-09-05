/// Mirror of `ParserFlags` in rust/src/ast.rs. Bit positions are ABI
/// contract; keep in sync with the vendored crate.
abstract final class FluxerParserFlags {
  static const int spoilers = 1 << 0;
  static const int headings = 1 << 1;
  static const int lists = 1 << 2;
  static const int codeBlocks = 1 << 3;
  static const int maskedLinks = 1 << 4;
  static const int commandMentions = 1 << 5;
  static const int guildNavigations = 1 << 6;
  static const int userMentions = 1 << 7;
  static const int roleMentions = 1 << 8;
  static const int channelMentions = 1 << 9;
  static const int everyoneMentions = 1 << 10;
  static const int blockquotes = 1 << 11;
  static const int multilineBlockquotes = 1 << 12;
  static const int subtext = 1 << 13;
  static const int tables = 1 << 14;
  static const int alerts = 1 << 15;
  static const int autolinks = 1 << 16;

  static const int all =
      spoilers |
      headings |
      lists |
      codeBlocks |
      maskedLinks |
      commandMentions |
      guildNavigations |
      userMentions |
      roleMentions |
      channelMentions |
      everyoneMentions |
      blockquotes |
      multilineBlockquotes |
      subtext |
      tables |
      alerts |
      autolinks;

  static const int none = 0;
}
