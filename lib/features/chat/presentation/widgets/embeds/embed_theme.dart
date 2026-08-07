import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Theme link embed card.
class EmbedTheme extends StatelessWidget {
  const EmbedTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    return _EmbedCard(
      icon: _IconCircle(
        color: context.colors.brandPrimary,
        child: PhosphorIcon(
          PhosphorIconsBold.palette,
          size: 24,
          color: context.colors.textOnBrandPrimary,
        ),
      ),
      title: Text(
        l10n.embedThemeTitle,
        style: context.textStyles.channelName.copyWith(
          color: context.colors.textPrimary,
          fontSize: 15,
          letterSpacing: -0.1,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        l10n.embedThemeSubtitle,
        style: context.textStyles.embedFooter.copyWith(
          color: context.colors.textTertiaryMuted,
          height: 1.2,
        ),
      ),
      footer: FluxerButton.dangerPrimary(
        label: l10n.embedThemeUnavailableButton,
      ),
    );
  }
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
