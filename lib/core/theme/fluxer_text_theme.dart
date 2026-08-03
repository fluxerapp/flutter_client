import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_fonts.dart';

class FluxerTextTheme extends ThemeExtension<FluxerTextTheme> {
  const FluxerTextTheme({
    required this.heading,
    required this.channelName,
    required this.username,
    required this.messageText,
    required this.codeText,
    required this.bodyMedium,
    required this.bodySmall,
    required this.label,
    required this.timestamp,
    required this.smallText,
    required this.categoryName,
    required this.inputText,
    required this.inputHint,
    required this.embedTitle,
    required this.embedDescription,
    required this.embedFooter,
    required this.quote,
    required this.quoteLink,
  });

  factory FluxerTextTheme.fromColors(FluxerColorTheme colors) {
    return FluxerTextTheme(
      heading: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),
      channelName: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),
      username: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: colors.textPrimary,
      ),
      messageText: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colors.textChat,
        height: 1.375,
      ),
      codeText: const TextStyle(
        fontFamily: FluxerFonts.mono,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.375,
      ),
      bodyMedium: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colors.textPrimary,
      ),
      bodySmall: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.textPrimaryMuted,
      ),
      label: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colors.textPrimary,
      ),
      timestamp: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colors.textPrimaryMuted,
      ),
      smallText: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: colors.textPrimaryMuted,
        letterSpacing: 0.02,
      ),
      categoryName: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        color: colors.textPrimaryMuted,
      ),
      inputText: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colors.textChat,
      ),
      inputHint: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colors.textChatMuted,
      ),
      embedTitle: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colors.textLink,
      ),
      embedDescription: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.textChat,
        height: 1.3,
      ),
      embedFooter: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colors.textPrimaryMuted,
      ),
      quote: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: colors.textSecondary,
        height: 1.4,
      ),
      quoteLink: TextStyle(
        fontFamily: FluxerFonts.sans,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: colors.textLink,
        height: 1.4,
        decoration: TextDecoration.none,
      ),
    );
  }

  final TextStyle heading;
  final TextStyle channelName;
  final TextStyle username;
  final TextStyle messageText;
  final TextStyle codeText;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle label;
  final TextStyle timestamp;
  final TextStyle smallText;
  final TextStyle categoryName;
  final TextStyle inputText;
  final TextStyle inputHint;
  final TextStyle embedTitle;
  final TextStyle embedDescription;
  final TextStyle embedFooter;
  final TextStyle quote;
  final TextStyle quoteLink;

  @override
  FluxerTextTheme copyWith({
    TextStyle? heading,
    TextStyle? channelName,
    TextStyle? username,
    TextStyle? messageText,
    TextStyle? codeText,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? label,
    TextStyle? timestamp,
    TextStyle? smallText,
    TextStyle? categoryName,
    TextStyle? inputText,
    TextStyle? inputHint,
    TextStyle? embedTitle,
    TextStyle? embedDescription,
    TextStyle? embedFooter,
    TextStyle? quote,
    TextStyle? quoteLink,
  }) {
    return FluxerTextTheme(
      heading: heading ?? this.heading,
      channelName: channelName ?? this.channelName,
      username: username ?? this.username,
      messageText: messageText ?? this.messageText,
      codeText: codeText ?? this.codeText,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      label: label ?? this.label,
      timestamp: timestamp ?? this.timestamp,
      smallText: smallText ?? this.smallText,
      categoryName: categoryName ?? this.categoryName,
      inputText: inputText ?? this.inputText,
      inputHint: inputHint ?? this.inputHint,
      embedTitle: embedTitle ?? this.embedTitle,
      embedDescription: embedDescription ?? this.embedDescription,
      embedFooter: embedFooter ?? this.embedFooter,
      quote: quote ?? this.quote,
      quoteLink: quoteLink ?? this.quoteLink,
    );
  }

  @override
  FluxerTextTheme lerp(FluxerTextTheme? other, double t) {
    if (other is! FluxerTextTheme) {
      return this;
    }
    return FluxerTextTheme(
      heading: TextStyle.lerp(heading, other.heading, t)!,
      channelName: TextStyle.lerp(channelName, other.channelName, t)!,
      username: TextStyle.lerp(username, other.username, t)!,
      messageText: TextStyle.lerp(messageText, other.messageText, t)!,
      codeText: TextStyle.lerp(codeText, other.codeText, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
      timestamp: TextStyle.lerp(timestamp, other.timestamp, t)!,
      smallText: TextStyle.lerp(smallText, other.smallText, t)!,
      categoryName: TextStyle.lerp(categoryName, other.categoryName, t)!,
      inputText: TextStyle.lerp(inputText, other.inputText, t)!,
      inputHint: TextStyle.lerp(inputHint, other.inputHint, t)!,
      embedTitle: TextStyle.lerp(embedTitle, other.embedTitle, t)!,
      embedDescription: TextStyle.lerp(
        embedDescription,
        other.embedDescription,
        t,
      )!,
      embedFooter: TextStyle.lerp(embedFooter, other.embedFooter, t)!,
      quote: TextStyle.lerp(quote, other.quote, t)!,
      quoteLink: TextStyle.lerp(quoteLink, other.quoteLink, t)!,
    );
  }
}
