import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class DiscoverySidebar extends StatelessWidget {
  const DiscoverySidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    return ColoredBox(
      color: colors.channelSidebarBackground,
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: layout.s2,
          vertical: layout.s2,
        ),
        children: <Widget>[
          _DiscoverySidebarItem(
            label: l10n.discoveryCommunities,
            icon: PhosphorIconsFill.usersThree,
            isActive: true,
            textStyles: textStyles,
            colors: colors,
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
    required this.textStyles,
    required this.colors,
    this.isActive = false,
  });

  final String label;
  final IconData icon;
  final bool isActive;
  final FluxerTextTheme textStyles;
  final FluxerColorTheme colors;

  @override
  Widget build(BuildContext context) {
    final Color textColor = isActive
        ? colors.textPrimary
        : colors.textSecondary;
    final Color backgroundColor = isActive
        ? colors.backgroundModifierSelected
        : Colors.transparent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: <Widget>[
          PhosphorIcon(icon, size: 18, color: textColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: textStyles.bodyMedium.copyWith(
                color: textColor,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
