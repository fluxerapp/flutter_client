import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/alt_text_badge.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';

String? resolvedMediaAltText(String? description) {
  final String? trimmed = description?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }
  return trimmed;
}

enum MediaAltTextCaption { whenEnabled, never }

class MediaAltText extends ConsumerWidget {
  const MediaAltText({
    required this.altText,
    required this.child,
    this.caption = MediaAltTextCaption.whenEnabled,
    this.captionWidth,
    super.key,
  });

  final String? altText;
  final Widget child;
  final MediaAltTextCaption caption;
  final double? captionWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? text = resolvedMediaAltText(altText);
    if (text == null) {
      return child;
    }
    final bool showCaption =
        caption == MediaAltTextCaption.whenEnabled &&
        ref.watch(
          appearancePreferencesProvider.select(
            (AppearancePreferencesState state) => state.showAltTextOnImages,
          ),
        );
    final Widget media = Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (!showCaption)
          Positioned(right: 6, bottom: 6, child: AltTextBadge(altText: text)),
      ],
    );
    if (!showCaption) {
      return media;
    }
    final Widget labeled = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        media,
        SizedBox(height: context.layout.s1),
        ExcludeSemantics(
          child: Text(
            text,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ),
      ],
    );
    final double? width = captionWidth;
    if (width == null || width <= 0) {
      return labeled;
    }
    return SizedBox(width: width, child: labeled);
  }
}
