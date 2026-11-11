import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/desktop_settings_text.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_settings_search_field.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class SettingsSidebar extends StatelessWidget {
  final List<SettingsSidebarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final String? userId;
  final String? username;
  final String? avatarUrl;
  final int? avatarColor;
  final Widget? footer;
  final bool showSearch;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchClear;
  final String? emptySearchMessage;
  final Color? backgroundColor;
  final VoidCallback? onProfileTap;
  final bool profileSelected;
  final double desktopTopInset;

  const SettingsSidebar({
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
    this.userId,
    this.username,
    this.avatarUrl,
    this.avatarColor,
    this.footer,
    this.showSearch = true,
    this.searchController,
    this.onSearchChanged,
    this.onSearchClear,
    this.emptySearchMessage,
    this.backgroundColor,
    this.onProfileTap,
    this.profileSelected = false,
    this.desktopTopInset = 16,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context);
    }
    return Container(
      width: double.infinity,
      color: backgroundColor ?? context.colors.backgroundPrimary,
      child: Column(
        children: [
          if (showSearch && searchController != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: UserSettingsSearchField(
                controller: searchController!,
                onChanged: onSearchChanged ?? (_) {},
                onClear: onSearchClear ?? () {},
                padding: EdgeInsets.zero,
              ),
            ),
          if (username != null)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(18, 8, 16, 24),
              child: Row(
                children: [
                  FluxerAvatar.user(
                    fallbackText: username,
                    userId: userId ?? '',
                    imageUrl: avatarUrl,
                    avatarColor: avatarColor,
                    size: 32,
                    showStatus: false,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      username!,
                      style: context.textStyles.channelName,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: items.isEmpty && emptySearchMessage != null
                ? Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(28, 8, 16, 8),
                    child: Text(
                      emptySearchMessage!,
                      style: context.textStyles.bodyMedium.copyWith(
                        color: context.colors.textPrimaryMuted,
                      ),
                    ),
                  )
                : Material(
                    color: Colors.transparent,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final isSelected = index == selectedIndex;
                        if (item.isSeparator) {
                          return _buildSeparator(context, item);
                        }
                        return _buildItem(
                          context,
                          item,
                          isSelected,
                          () => onSelected(index),
                        );
                      },
                    ),
                  ),
          ),
          if (footer != null)
            Padding(padding: const EdgeInsets.all(12), child: footer),
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    final List<Widget> header = <Widget>[
      if (showSearch && searchController != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: UserSettingsSearchField(
            controller: searchController!,
            onChanged: onSearchChanged ?? (_) {},
            onClear: onSearchClear ?? () {},
            padding: EdgeInsets.zero,
          ),
        ),
      if (username != null)
        _DesktopSettingsSidebarProfileButton(
          userId: userId,
          username: username!,
          avatarUrl: avatarUrl,
          avatarColor: avatarColor,
          selected: profileSelected,
          onTap: onProfileTap,
        ),
    ];
    final List<Widget> navChildren = <Widget>[];
    for (int index = 0; index < items.length; index++) {
      final SettingsSidebarItem item = items[index];
      if (item.isHidden) {
        continue;
      }
      if (item.isSeparator) {
        final bool isFirst = navChildren.isEmpty;
        if (!isFirst) {
          navChildren.add(const SizedBox(height: 8));
        }
        if (item.label.isNotEmpty) {
          navChildren.add(DesktopSettingsSidebarTitle(item.label));
        }
        continue;
      }
      navChildren.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: _DesktopSettingsSidebarItem(
            label: item.label,
            icon: item.icon,
            leading: item.leading,
            selected: index == selectedIndex,
            danger: item.isDestructive,
            onTap: () => onSelected(index),
          ),
        ),
      );
    }
    return ColoredBox(
      color: backgroundColor ?? fluxerFormSurfaceBackground(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (header.isNotEmpty)
            Padding(
              padding: EdgeInsets.fromLTRB(12, desktopTopInset, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: header,
              ),
            )
          else
            SizedBox(height: desktopTopInset),
          Expanded(
            child: items.isEmpty && emptySearchMessage != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: Text(
                      emptySearchMessage!,
                      textAlign: TextAlign.center,
                      style: context.textStyles.bodyMedium.copyWith(
                        fontSize: 14,
                        height: 20 / 14,
                        color: context.colors.textTertiary,
                      ),
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: navChildren,
                  ),
          ),
          if (footer != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 12, 16),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: footer,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSeparator(BuildContext context, SettingsSidebarItem item) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: context.colors.borderColor, height: 1),
            if (item.label.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 4),
                child: Text(item.label, style: context.textStyles.categoryName),
              ),
          ],
        ),
      );

  Widget _buildItem(
    BuildContext context,
    SettingsSidebarItem item,
    bool isSelected,
    VoidCallback onTap,
  ) {
    final color = item.isDestructive
        ? context.colors.textDanger
        : isSelected
        ? context.colors.textPrimary
        : context.colors.textPrimaryMuted;

    final Widget row = Row(
      children: [
        if (item.leading != null) ...[
          IconTheme.merge(
            data: IconThemeData(color: color, size: 20),
            child: item.leading!,
          ),
          const SizedBox(width: 8),
        ] else if (item.icon != null) ...[
          PhosphorIcon(item.icon!, size: 20, color: color),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            item.label,
            style:
                (isSelected
                        ? context.textStyles.username
                        : context.textStyles.bodyMedium)
                    .copyWith(color: color),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Semantics(
        container: true,
        button: true,
        selected: isSelected,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.colors.backgroundModifierSelected
                  : null,
              borderRadius: BorderRadius.circular(4),
            ),
            child: row,
          ),
        ),
      ),
    );
  }
}

class SettingsSidebarItem {
  final String label;
  final bool isSeparator;
  final IconData? icon;
  final Widget? leading;
  final bool isDestructive;
  final bool isHidden;

  const SettingsSidebarItem(
    this.label, {
    this.icon,
    this.leading,
    this.isSeparator = false,
    this.isDestructive = false,
    this.isHidden = false,
  });

  const SettingsSidebarItem.separator([this.label = ''])
    : isSeparator = true,
      icon = null,
      leading = null,
      isDestructive = false,
      isHidden = false;
}

class _DesktopSettingsSidebarItem extends StatelessWidget {
  const _DesktopSettingsSidebarItem({
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
    this.leading,
    this.danger = false,
  });

  final String label;
  final IconData? icon;
  final Widget? leading;
  final bool selected;
  final bool danger;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color dangerText = fluxerDesktopMenuDangerText(colors);
    final Color hoverColor = danger
        ? fluxerDesktopMenuDangerBackground(colors)
        : colors.surfaceInteractiveHoverBg;
    final BorderRadius radius = context.layout.radiusLg;
    return Semantics(
      container: true,
      button: true,
      selected: selected,
      child: FluxerSelectableRow(
        isSelected: selected && !danger,
        selectedColor: colors.surfaceInteractiveSelectedBg,
        borderRadius: radius,
        hoverColor: hoverColor,
        pressedColor: hoverColor,
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        onTap: onTap,
        childBuilder: (BuildContext context, Set<WidgetState> states) {
          final bool hovered = states.contains(WidgetState.hovered);
          final Color textColor = danger
              ? dangerText
              : selected || hovered
              ? colors.textPrimary
              : colors.textPrimaryMuted;
          final Color iconColor = danger
              ? dangerText
              : selected || hovered
              ? colors.textPrimary
              : colors.textTertiary;
          return ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 22),
            child: Row(
              children: <Widget>[
                if (leading != null)
                  SizedBox.square(
                    dimension: 20,
                    child: IconTheme.merge(
                      data: IconThemeData(color: iconColor, size: 20),
                      child: leading!,
                    ),
                  )
                else if (icon != null)
                  PhosphorIcon(icon!, size: 20, color: iconColor),
                if (leading != null || icon != null) const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.bodyMedium.copyWith(
                      fontSize: 13,
                      height: 18 / 13,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DesktopSettingsSidebarProfileButton extends StatelessWidget {
  const _DesktopSettingsSidebarProfileButton({
    required this.userId,
    required this.username,
    required this.avatarUrl,
    required this.avatarColor,
    required this.selected,
    required this.onTap,
  });

  final String? userId;
  final String username;
  final String? avatarUrl;
  final int? avatarColor;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final BorderRadius radius = context.layout.radiusLg;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Semantics(
        button: onTap != null,
        selected: selected,
        child: FluxerSelectableRow(
          isSelected: selected,
          selectedColor: colors.surfaceInteractiveSelectedBg,
          borderRadius: radius,
          hoverColor: colors.surfaceInteractiveHoverBg,
          pressedColor: colors.surfaceInteractiveHoverBg,
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
          onTap: onTap,
          childBuilder: (BuildContext context, Set<WidgetState> states) {
            final bool emphasized =
                selected || states.contains(WidgetState.hovered);
            final Color hintColor = emphasized
                ? colors.textSecondary
                : colors.textTertiary;
            return ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 30),
              child: Row(
                children: <Widget>[
                  FluxerAvatar.user(
                    fallbackText: username,
                    userId: userId ?? '',
                    imageUrl: avatarUrl,
                    avatarColor: avatarColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            username,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyles.bodyMedium.copyWith(
                              fontSize: 15,
                              height: 20 / 15,
                              fontWeight: FontWeight.w600,
                              color: emphasized
                                  ? colors.textPrimary
                                  : colors.textPrimaryMuted,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: <Widget>[
                              PhosphorIcon(
                                PhosphorIconsBold.pencil,
                                size: 12,
                                color: hintColor,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  l10n.userProfileEditProfile,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodyMedium.copyWith(
                                    fontSize: 12,
                                    height: 16 / 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

int settingsSidebarIndexForLabel(
  List<SettingsSidebarItem> items,
  String label,
) {
  for (int i = 0; i < items.length; i++) {
    final SettingsSidebarItem item = items[i];
    if (!item.isSeparator && item.label == label) {
      return i;
    }
  }
  return 0;
}

String? settingsSidebarLabelAtIndex(
  List<SettingsSidebarItem> items,
  int index,
) {
  if (index < 0 || index >= items.length) {
    return null;
  }
  final SettingsSidebarItem item = items[index];
  if (item.isSeparator) {
    return null;
  }
  return item.label;
}
