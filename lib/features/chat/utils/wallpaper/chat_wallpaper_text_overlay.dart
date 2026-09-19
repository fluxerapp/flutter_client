import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/material_ui.dart';

FluxerColorTheme overlayChatWallpaperColors({
  required FluxerColorTheme current,
  required FluxerColorTheme source,
}) {
  return current.copyWith(
    textPrimary: source.textPrimary,
    textSecondary: source.textSecondary,
    textTertiary: source.textTertiary,
    textPrimaryMuted: source.textPrimaryMuted,
    textChat: source.textChat,
    textChatMuted: source.textChatMuted,
    textLink: source.textLink,
    textTertiaryMuted: source.textTertiaryMuted,
    textTertiarySecondary: source.textTertiarySecondary,
    textCode: source.textCode,
    bgCode: source.bgCode,
    bgCodeBlock: source.bgCodeBlock,
    bgTableHeader: source.bgTableHeader,
    bgTableRowOdd: source.bgTableRowOdd,
    bgTableRowEven: source.bgTableRowEven,
  );
}

FluxerTextTheme overlayChatWallpaperTextStyles({
  required FluxerTextTheme current,
  required FluxerColorTheme colors,
}) {
  return current.copyWith(
    heading: current.heading.copyWith(color: colors.textPrimary),
    channelName: current.channelName.copyWith(color: colors.textPrimary),
    username: current.username.copyWith(color: colors.textPrimary),
    messageText: current.messageText.copyWith(color: colors.textChat),
    codeText: current.codeText.copyWith(color: colors.textCode),
    bodyMedium: current.bodyMedium.copyWith(color: colors.textPrimary),
    bodySmall: current.bodySmall.copyWith(color: colors.textPrimaryMuted),
    label: current.label.copyWith(color: colors.textPrimary),
    timestamp: current.timestamp.copyWith(color: colors.textPrimaryMuted),
    smallText: current.smallText.copyWith(color: colors.textPrimaryMuted),
    categoryName: current.categoryName.copyWith(color: colors.textPrimaryMuted),
    inputText: current.inputText.copyWith(color: colors.textChat),
    inputHint: current.inputHint.copyWith(color: colors.textChatMuted),
    embedTitle: current.embedTitle.copyWith(color: colors.textLink),
    embedDescription: current.embedDescription.copyWith(color: colors.textChat),
    embedFooter: current.embedFooter.copyWith(color: colors.textPrimaryMuted),
    quote: current.quote.copyWith(color: colors.textSecondary),
    quoteLink: current.quoteLink.copyWith(color: colors.textLink),
  );
}

ThemeData overlayChatWallpaperTextTheme({
  required ThemeData theme,
  required FluxerColorTheme source,
}) {
  final FluxerColorTheme current = theme.extension<FluxerColorTheme>()!;
  final FluxerColorTheme mixed = overlayChatWallpaperColors(
    current: current,
    source: source,
  );
  final FluxerTextTheme currentText = theme.extension<FluxerTextTheme>()!;
  final List<ThemeExtension<dynamic>> extensions = <ThemeExtension<dynamic>>[
    mixed,
    overlayChatWallpaperTextStyles(current: currentText, colors: mixed),
  ];
  for (final ThemeExtension<dynamic> extension in theme.extensions.values) {
    if (extension is FluxerColorTheme || extension is FluxerTextTheme) {
      continue;
    }
    extensions.add(extension);
  }
  return theme.copyWith(extensions: extensions);
}
