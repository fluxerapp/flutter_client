import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/wallpaper/chat_wallpaper_text_theme.dart';
import 'package:fluxer_app/features/themes/presentation/theme_accept_sheet.dart';
import 'package:fluxer_app/features/themes/providers/shared_theme_css_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Theme link embed card.
class EmbedTheme extends ConsumerWidget {
  const EmbedTheme({required this.themeId, super.key});

  final String themeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final AsyncValue<String> css = ref.watch(sharedThemeCssProvider(themeId));
    return ChatSurfaceTheme(
      builder: (BuildContext context) => css.when(
        loading: () => _EmbedCard(
          icon: const _SkeletonCircle(),
          title: const _SkeletonBar(width: 140),
          subtitle: const _SkeletonBar(width: 100),
          footer: FluxerButton.primary(label: l10n.embedThemeImport),
        ),
        error: (_, _) => _EmbedCard(
          icon: _IconCircle(
            color: context.colors.backgroundTertiary,
            child: PhosphorIcon(
              PhosphorIconsBold.question,
              size: 24,
              color: context.colors.statusDanger,
            ),
          ),
          title: _title(
            context,
            l10n.embedThemeUnavailableTitle,
            context.colors.statusDanger,
          ),
          subtitle: _subtitle(context, l10n.embedThemeUnavailableDescription),
          footer: FluxerButton.primary(label: l10n.embedThemeImportUnavailable),
        ),
        data: (_) => _EmbedCard(
          icon: _IconCircle(
            color: context.colors.brandPrimary,
            child: PhosphorIcon(
              PhosphorIconsBold.palette,
              size: 24,
              color: context.colors.textOnBrandPrimary,
            ),
          ),
          title: _title(
            context,
            l10n.embedThemeTitle,
            context.colors.textPrimary,
          ),
          subtitle: _subtitle(context, l10n.embedThemeHelp),
          footer: FluxerButton.primary(
            label: l10n.embedThemeImport,
            onPressed: () =>
                unawaited(ThemeAcceptSheet.show(context, themeId: themeId)),
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context, String text, Color color) => Text(
    text,
    style: context.textStyles.channelName.copyWith(
      color: color,
      fontSize: 15,
      letterSpacing: -0.1,
    ),
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
  );

  Widget _subtitle(BuildContext context, String text) => Text(
    text,
    style: context.textStyles.embedFooter.copyWith(
      color: context.colors.textTertiaryMuted,
      height: 1.2,
    ),
  );
}

class _EmbedCard extends StatelessWidget {
  final Widget icon;
  final Widget title;
  final Widget? subtitle;
  final Widget footer;

  const _EmbedCard({
    required this.icon,
    required this.title,
    required this.footer,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(maxWidth: 360),
    decoration: BoxDecoration(
      color: context.colors.backgroundSecondary,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: context.colors.borderColor),
    ),
    clipBehavior: Clip.hardEdge,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SizedBox(width: 48, child: Center(child: icon)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    title,
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      subtitle!,
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: context.colors.borderColor),
        Padding(padding: const EdgeInsets.all(12), child: footer),
      ],
    ),
  );
}

class _IconCircle extends StatelessWidget {
  final Color color;
  final Widget child;

  const _IconCircle({required this.color, required this.child});

  @override
  Widget build(BuildContext context) => Container(
    width: 44,
    height: 44,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    child: Center(child: child),
  );
}

class _SkeletonCircle extends StatelessWidget {
  const _SkeletonCircle();

  @override
  Widget build(BuildContext context) => Container(
    width: 44,
    height: 44,
    decoration: BoxDecoration(
      color: context.colors.backgroundTertiary,
      shape: BoxShape.circle,
    ),
  );
}

class _SkeletonBar extends StatelessWidget {
  const _SkeletonBar({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: 12,
    decoration: BoxDecoration(
      color: context.colors.backgroundTertiary,
      borderRadius: BorderRadius.circular(4),
    ),
  );
}
