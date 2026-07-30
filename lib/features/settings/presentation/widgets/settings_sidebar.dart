import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SettingsSidebar extends StatelessWidget {
  final List<SettingsSidebarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final VoidCallback? onClose;
  final String? userId;
  final String? username;
  final String? avatarUrl;
  final int? avatarColor;
  final Widget? footer;
  final bool showSearch;
  final Color? backgroundColor;

  const SettingsSidebar({
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
    this.onClose,
    this.userId,
    this.username,
    this.avatarUrl,
    this.avatarColor,
    this.footer,
    this.showSearch = true,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    color: backgroundColor ?? context.colors.backgroundPrimary,
    child: Column(
      children: [
        if (showSearch)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
            child: TextField(
              style: TextStyle(color: context.colors.textChat, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Search settings...',
                hintStyle: TextStyle(
                  color: context.colors.textPrimaryMuted,
                  fontSize: 14,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4),
                  child: PhosphorIcon(
                    PhosphorIconsBold.magnifyingGlass,
                    size: 18,
                    color: context.colors.textPrimaryMuted,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 20),
                filled: true,
                fillColor: context.colors.backgroundTertiary,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: context.colors.borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: context.colors.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: context.colors.borderColor),
                ),
              ),
            ),
          ),
        if (username != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 8, 16, 24),
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
                    style: TextStyle(
                      color: context.colors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          child: Material(
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
    final color = item.isDisabled
        ? context.colors.textPrimaryMuted
        : item.isDestructive
        ? context.colors.textDanger
        : isSelected
        ? context.colors.textPrimary
        : context.colors.textPrimaryMuted;

    final Widget row = Row(
      children: [
        if (item.icon != null) ...[
          PhosphorIcon(item.icon!, size: 20, color: color),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            item.label,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: isSelected && !item.isDisabled
                  ? FontWeight.w500
                  : FontWeight.w400,
            ),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: InkWell(
        onTap: item.isDisabled ? (item.onDisabledTap ?? onTap) : onTap,
        borderRadius: BorderRadius.circular(4),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected && !item.isDisabled
                ? context.colors.backgroundModifierSelected
                : null,
            borderRadius: BorderRadius.circular(4),
          ),
          child: item.isDisabled ? Opacity(opacity: 0.5, child: row) : row,
        ),
      ),
    );
  }
}

class SettingsSidebarItem {
  final String label;
  final bool isSeparator;
  final IconData? icon;
  final bool isDestructive;
  final bool isDisabled;
  final VoidCallback? onDisabledTap;

  const SettingsSidebarItem(
    this.label, {
    this.icon,
    this.isSeparator = false,
    this.isDestructive = false,
    this.isDisabled = false,
    this.onDisabledTap,
  });

  const SettingsSidebarItem.separator([this.label = ''])
    : isSeparator = true,
      icon = null,
      isDestructive = false,
      isDisabled = false,
      onDisabledTap = null;
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
