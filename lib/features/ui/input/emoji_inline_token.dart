import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart'
    show kSkinToneSurrogates, skinToneToName;

/// An inline emoji rendered as a monospace `:name:` chip while [wireText]
/// preserves the outgoing shortcode (`:name:` / `:name::skin-tone-N:`) or
/// custom-emoji markdown (`<a?:name:id>`).
class EmojiInlineToken extends InlineToken {
  EmojiInlineToken({required this.displayName, required this.wireText});

  final String displayName;

  @override
  final String wireText;

  @override
  Widget buildInline(BuildContext context, TextStyle? baseStyle) =>
      _EmojiChip(name: displayName);
}

/// Builds the wire form for an emoji selection.
///
/// Custom emoji ([surrogates] beginning with `<`) pass through verbatim;
/// unicode emoji become a `:name:` shortcode, or `:name::skin-tone-N:` when a
/// skin-tone modifier is present in [surrogates].
String buildEmojiWireToken(String name, String surrogates) {
  if (surrogates.startsWith('<')) {
    return surrogates;
  }
  for (final String tone in kSkinToneSurrogates) {
    if (surrogates.contains(tone)) {
      final String? toneName = skinToneToName(tone);
      if (toneName != null) {
        return ':$name::$toneName:';
      }
      break;
    }
  }
  return ':$name:';
}

/// Rewrites emoji shortcodes/markdown in [raw] into freshly allocated sentinels,
/// returning the rewritten string.
///
/// Custom emoji `<a?:name:id>` are always substituted. When
/// [includePlainShortcodes] is true, skin-tone and plain `:name:` shortcodes
/// are substituted too; pass false to leave ambiguous typed shortcodes (e.g.
/// `12:30:45`) untouched.
String substituteEmojiTokens(
  String raw,
  String Function(EmojiInlineToken token) allocate, {
  bool includePlainShortcodes = true,
}) {
  final RegExp customPattern = RegExp(r'<(a?):([a-zA-Z0-9_]+):(\d+)>');
  String result = raw.replaceAllMapped(customPattern, (Match match) {
    final String animated = match.group(1)!;
    final String name = match.group(2)!;
    final String id = match.group(3)!;
    return allocate(
      EmojiInlineToken(displayName: name, wireText: '<$animated:$name:$id>'),
    );
  });
  if (!includePlainShortcodes) {
    return result;
  }

  final RegExp skinTonePattern = RegExp(
    r':([a-zA-Z0-9_+\-]+)::skin-tone-([1-5]):',
  );
  result = result.replaceAllMapped(skinTonePattern, (Match match) {
    final String name = match.group(1)!;
    final String tone = match.group(2)!;
    return allocate(
      EmojiInlineToken(displayName: name, wireText: ':$name::skin-tone-$tone:'),
    );
  });

  final RegExp plainPattern = RegExp(r':([a-zA-Z0-9_+\-]+):');
  return result.replaceAllMapped(plainPattern, (Match match) {
    final String name = match.group(1)!;
    return allocate(EmojiInlineToken(displayName: name, wireText: ':$name:'));
  });
}

class _EmojiChip extends StatelessWidget {
  const _EmojiChip({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundModifierAccent,
          borderRadius: layout.radiusSm,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s1, vertical: 1),
          child: Text(
            ':$name:',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: colors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
