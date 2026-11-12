part of 'guild_sidebar.dart';

class _MembersSidebarTile extends ConsumerWidget {
  const _MembersSidebarTile({required this.guildId, required this.isSelected});

  final String guildId;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context, l10n);
    }
    final Color textColor = isSelected
        ? context.colors.textPrimary
        : context.colors.textTertiaryMuted;
    return FluxerSelectableRow(
      isSelected: isSelected,
      selectedColor: context.colors.backgroundModifierSelected,
      borderRadius: BorderRadius.circular(4),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      semanticLabel: navigationItemSemanticLabel(
        l10n: l10n,
        name: l10n.guildMembersChannelListLabel,
        isSelected: isSelected,
      ),
      onTap: () => context.go(RoutePaths.guildMembers(guildId)),
      child: Row(
        children: <Widget>[
          PhosphorIcon(PhosphorIconsFill.users, size: 20, color: textColor),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              l10n.guildMembersChannelListLabel,
              style: context.textStyles.channelName.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context, FluxerLocalizations l10n) {
    final Color idle = _desktopSidebarRowTextColor(
      context,
      selected: isSelected,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: FluxerSelectableRow(
        isSelected: isSelected,
        selectedColor: context.colors.surfaceInteractiveSelectedBg,
        borderRadius: context.layout.radiusMd,
        desktopSidebar: true,
        semanticLabel: navigationItemSemanticLabel(
          l10n: l10n,
          name: l10n.guildMembersChannelListLabel,
          isSelected: isSelected,
        ),
        onTap: () => context.go(RoutePaths.guildMembers(guildId)),
        childBuilder: (BuildContext context, Set<WidgetState> states) {
          final Color textColor = _desktopSidebarRowTextColor(
            context,
            hovered: states.contains(WidgetState.hovered),
            selected: isSelected,
          );
          return Row(
            children: <Widget>[
              PhosphorIcon(PhosphorIconsRegular.users, size: 20, color: idle),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  l10n.guildMembersChannelListLabel,
                  style: context.textStyles.channelName.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    height: 20 / 16,
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
