import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart'
    show kSkinToneSurrogates;
import 'package:material_ui/material_ui.dart';

final RegExp _customWirePattern = RegExp(r'<(a?):([a-zA-Z0-9_]+):(\d+)>');
final RegExp _skinToneShortcodePattern = RegExp(
  r':([a-zA-Z0-9_+\-]+)::skin-tone-([1-5]):',
);
final RegExp _plainShortcodePattern = RegExp(r':([a-zA-Z0-9_+\-]+):');

/// An inline emoji rendered as the actual emoji (sprite or custom-emoji image)
/// with a monospace `:name:` fallback, while [wireText] preserves the outgoing
/// shortcode (`:name:` / `:name::skin-tone-N:`), custom-emoji markdown
/// (`<a?:name:id>`), or raw unicode surrogate.
class EmojiInlineToken extends InlineToken {
  EmojiInlineToken({required this.displayName, required this.wireText});

  final String displayName;

  @override
  final String wireText;

  @override
  Widget buildInline(BuildContext context, TextStyle? baseStyle) =>
      _EmojiChip(name: displayName, wireText: wireText, baseStyle: baseStyle);
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
      final int index = kSkinToneSurrogates.indexOf(tone);
      return ':$name::skin-tone-${index + 1}:';
    }
  }
  return ':$name:';
}

/// Rewrites emoji wire forms in [raw] into freshly allocated sentinels,
/// returning the rewritten string.
///
/// Custom emoji `<a?:name:id>` and registry-resolvable raw unicode emoji are
/// always substituted. Shortcodes (`:name:` / `:name::skin-tone-N:`) are
/// substituted when [includePlainShortcodes] is true; when false only
/// registry-resolvable names are substituted, leaving ambiguous typed colons
/// (e.g. `12:30:45`) untouched.
String substituteEmojiTokens(
  String raw,
  String Function(EmojiInlineToken token) allocate, {
  bool includePlainShortcodes = true,
}) {
  String result = raw.replaceAllMapped(_customWirePattern, (Match match) {
    final String animated = match.group(1)!;
    final String name = match.group(2)!;
    final String id = match.group(3)!;
    return allocate(
      EmojiInlineToken(displayName: name, wireText: '<$animated:$name:$id>'),
    );
  });

  bool chipShortcode(String name) =>
      includePlainShortcodes || EmojiRegistry.entryByName(name) != null;

  result = result.replaceAllMapped(_skinToneShortcodePattern, (Match match) {
    final String name = match.group(1)!;
    if (!chipShortcode(name)) {
      return match.group(0)!;
    }
    final String tone = match.group(2)!;
    return allocate(
      EmojiInlineToken(displayName: name, wireText: ':$name::skin-tone-$tone:'),
    );
  });

  result = result.replaceAllMapped(_plainShortcodePattern, (Match match) {
    final String name = match.group(1)!;
    if (!chipShortcode(name)) {
      return match.group(0)!;
    }
    return allocate(EmojiInlineToken(displayName: name, wireText: ':$name:'));
  });

  final RegExp? unicodePattern = EmojiRegistry.unicodeEmojiRegexSync;
  if (unicodePattern == null) {
    return result;
  }
  return result.replaceAllMapped(unicodePattern, (Match match) {
    final String surrogate = match.group(0)!;
    final EmojiEntry? entry = EmojiRegistry.entryBySurrogates(surrogate);
    if (entry == null) {
      return surrogate;
    }
    return allocate(
      EmojiInlineToken(displayName: entry.primaryName, wireText: surrogate),
    );
  });
}

class _EmojiChip extends StatelessWidget {
  const _EmojiChip({
    required this.name,
    required this.wireText,
    required this.baseStyle,
  });

  final String name;
  final String wireText;
  final TextStyle? baseStyle;

  double get _size => (baseStyle?.fontSize ?? 16) * 1.5;

  @override
  Widget build(BuildContext context) {
    final RegExpMatch? custom = _customWirePattern.firstMatch(wireText);
    final Widget chip = custom != null
        ? _buildCustom(context, custom)
        : (_buildUnicode() ?? _FallbackChip(name: name));
    return IgnorePointer(
      child: Semantics(label: ':$name:', child: chip),
    );
  }

  Widget _buildCustom(BuildContext context, RegExpMatch match) {
    final bool animated = match.group(1) == 'a';
    final String id = match.group(3)!;
    final double size = _size;
    final int px = (size * MediaQuery.devicePixelRatioOf(context)).round();
    return SizedBox(
      width: size,
      height: size,
      child: CachedNetworkImage(
        imageUrl: FluxerMediaUrl.customEmoji(
          id: id,
          animated: animated,
          size: 96,
        ),
        // Shares the message renderers' cache entries (same key convention).
        cacheKey: 'emoji_${id}_${animated ? 'a' : 's'}_96',
        // Cap one decode axis only; capping both stretches non-square emoji
        // (issue #445). Skip resize on animated frames.
        memCacheWidth: animated ? null : px,
        fit: BoxFit.contain,
        fadeInDuration: Duration.zero,
        fadeOutDuration: Duration.zero,
        placeholder: (_, _) => _FallbackChip(name: name),
        errorBuilder: (_, _, _) => _FallbackChip(name: name),
      ),
    );
  }

  Widget? _buildUnicode() {
    EmojiEntry? entry;
    String? skinTone;
    if (wireText.startsWith(':')) {
      final RegExpMatch? toned = _skinToneShortcodePattern.firstMatch(wireText);
      if (toned != null) {
        entry = EmojiRegistry.entryByName(toned.group(1)!);
        skinTone = kSkinToneSurrogates[int.parse(toned.group(2)!) - 1];
      } else {
        entry = EmojiRegistry.entryByName(name);
      }
    } else {
      entry = EmojiRegistry.entryBySurrogates(wireText);
      if (entry != null && wireText != entry.surrogates) {
        final int toneIndex = entry.skinSurrogates.indexOf(wireText);
        if (toneIndex >= 0 && toneIndex < kSkinToneSurrogates.length) {
          skinTone = kSkinToneSurrogates[toneIndex];
        }
      }
    }
    if (entry == null) {
      return null;
    }
    return SpriteEmoji(
      index: entry.spriteIndex,
      diversityIndex: entry.diversityIndex,
      skinTone: skinTone,
      size: _size,
    );
  }
}

class _FallbackChip extends StatelessWidget {
  const _FallbackChip({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundModifierAccent,
        borderRadius: layout.radiusSm,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.s1, vertical: 1),
        child: Text(
          ':$name:',
          style: context.textStyles.codeText.copyWith(
            fontSize: 12,
            color: colors.textSecondary,
          ),
        ),
      ),
    );
  }
}
