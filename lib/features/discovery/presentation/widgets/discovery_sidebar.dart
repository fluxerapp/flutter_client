import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class DiscoverySidebar extends StatelessWidget {
  const DiscoverySidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    return ColoredBox(
      color: colors.channelSidebarBackground,
      child: ListView(
        padding: EdgeInsets.all(layout.s2),
        children: <Widget>[
          _DiscoverySidebarItem(
            label: l10n.discoveryCommunities,
            icon: PhosphorIconsFill.usersThree,
            isActive: true,
          ),
          const SizedBox(height: 4),
          _DiscoverySidebarItem(
            label: l10n.discoverySidebarApps,
            icon: PhosphorIconsBold.appWindow,
            comingSoonLabel: l10n.discoverySidebarComingSoon,
            semanticLabel: l10n.discoverySidebarComingSoonItem(
              l10n.discoverySidebarApps,
            ),
          ),
          const SizedBox(height: 4),
          _DiscoverySidebarItem(
            label: l10n.discoverySidebarThemes,
            icon: PhosphorIconsBold.palette,
            comingSoonLabel: l10n.discoverySidebarComingSoon,
            semanticLabel: l10n.discoverySidebarComingSoonItem(
              l10n.discoverySidebarThemes,
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscoverySidebarItem extends StatelessWidget {
  const _DiscoverySidebarItem({
    required this.label,
    required this.icon,
    this.isActive = false,
    this.comingSoonLabel,
    this.semanticLabel,
  });

  final String label;
  final IconData icon;
  final bool isActive;
  final String? comingSoonLabel;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final String? comingSoonLabel = this.comingSoonLabel;
    final bool disabled = comingSoonLabel != null;
    final Color textColor = disabled
        ? colors.textTertiaryMuted
        : isActive
        ? colors.textPrimary
        : colors.textSecondary;
    return Semantics(
      button: true,
      enabled: !disabled,
      selected: isActive,
      label: semanticLabel ?? label,
      excludeSemantics: true,
      child: MouseRegion(
        cursor: disabled
            ? SystemMouseCursors.forbidden
            : SystemMouseCursors.click,
        child: Container(
          constraints: const BoxConstraints(minHeight: 44),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive
                ? colors.backgroundModifierSelected
                : Colors.transparent,
            borderRadius: context.layout.radiusMd,
          ),
          child: Row(
            children: <Widget>[
              PhosphorIcon(icon, size: 20, color: textColor),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (comingSoonLabel != null) ...<Widget>[
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colors.backgroundTertiary,
                    borderRadius: context.layout.radiusSm,
                  ),
                  child: Text(
                    comingSoonLabel.toUpperCase(),
                    style: fluxerDesktopEyebrowStyle(
                      context,
                    ).copyWith(color: colors.textTertiary),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
