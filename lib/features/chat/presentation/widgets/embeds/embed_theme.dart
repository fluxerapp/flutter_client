import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/wallpaper/chat_wallpaper_text_theme.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class EmbedTheme extends StatelessWidget {
  const EmbedTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    return ChatSurfaceTheme(
      builder: (BuildContext context) => _EmbedCard(
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
          l10n.embedThemeWebOnly,
          style: context.textStyles.embedFooter.copyWith(
            color: context.colors.textTertiaryMuted,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}

class _EmbedCard extends StatelessWidget {
  final Widget icon;
  final Widget title;
  final Widget? subtitle;

  const _EmbedCard({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(maxWidth: 360),
    decoration: BoxDecoration(
      color: context.colors.backgroundSecondary,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: context.colors.borderColor),
    ),
    clipBehavior: Clip.hardEdge,
    child: Padding(
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
                if (subtitle != null) ...[const SizedBox(height: 2), subtitle!],
              ],
            ),
          ),
        ],
      ),
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
