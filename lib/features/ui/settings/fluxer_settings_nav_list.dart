import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerSettingsNavItem {
  const FluxerSettingsNavItem({
    required this.label,
    required this.icon,
    required this.onTap,
    this.hint,
    this.isDanger = false,
    this.isDisabled = false,
    this.onDisabledTap,
  });

  final String label;
  final String? hint;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDanger;
  final bool isDisabled;
  final VoidCallback? onDisabledTap;
}

class FluxerSettingsNavGroup {
  const FluxerSettingsNavGroup({required this.items, this.label});

  final String? label;
  final List<FluxerSettingsNavItem> items;
}

class FluxerSettingsNavList extends StatelessWidget {
  const FluxerSettingsNavList({
    required this.groups,
    super.key,
    this.controller,
    this.header,
    this.empty,
    this.footer,
    this.padding,
  });

  final List<FluxerSettingsNavGroup> groups;
  final ScrollController? controller;
  final Widget? header;
  final Widget? empty;
  final Widget? footer;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final int headerCount = header == null ? 0 : 1;
    final int emptyCount = empty != null && groups.isEmpty ? 1 : 0;
    final int footerCount = footer == null ? 0 : 1;

    return ListView.builder(
      controller: controller,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: padding ?? EdgeInsets.symmetric(horizontal: layout.s4),
      ),
      itemCount: headerCount + groups.length + emptyCount + footerCount,
      itemBuilder: (context, index) {
        var remaining = index;
        if (header != null) {
          if (remaining == 0) {
            return header!;
          }
          remaining--;
        }
        if (remaining < groups.length) {
          return _FluxerSettingsNavGroupWidget(group: groups[remaining]);
        }
        remaining -= groups.length;
        if (emptyCount == 1) {
          if (remaining == 0) {
            return empty!;
          }
          remaining--;
        }
        return footer!;
      },
    );
  }
}

class _FluxerSettingsNavGroupWidget extends StatelessWidget {
  const _FluxerSettingsNavGroupWidget({required this.group});

  final FluxerSettingsNavGroup group;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return Padding(
      padding: EdgeInsets.only(bottom: layout.s2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (group.label != null)
            Padding(
              padding: EdgeInsets.only(
                top: layout.s2,
                bottom: layout.s2,
                left: layout.s1,
              ),
              child: Text(group.label!, style: context.textStyles.categoryName),
            ),
          FluxerMenuGroup(
            children: [
              for (final item in group.items)
                _FluxerSettingsNavItemWidget(item: item),
            ],
          ),
        ],
      ),
    );
  }
}

class _FluxerSettingsNavItemWidget extends StatelessWidget {
  const _FluxerSettingsNavItemWidget({required this.item});

  final FluxerSettingsNavItem item;

  @override
  Widget build(BuildContext context) {
    if (item.isDanger) {
      return FluxerBottomSheetMenuItem(
        label: item.label,
        onTap: item.onTap,
        icon: item.icon,
        isDanger: true,
      );
    }

    if (item.isDisabled) {
      return FluxerBottomSheetMenuItem(
        label: item.label,
        onTap: item.onDisabledTap ?? item.onTap,
        icon: item.icon,
        enabled: false,
        trailing: PhosphorIcon(
          PhosphorIconsBold.caretRight,
          size: 20,
          color: context.colors.textPrimaryMuted,
        ),
      );
    }

    return FluxerBottomSheetSubmenuItem(
      label: item.label,
      hint: item.hint,
      onTap: item.onTap,
      icon: item.icon,
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerSettingsNavList')
Widget fluxerSettingsNavListPreview() {
  return SizedBox(
    height: 220,
    child: FluxerSettingsNavList(
      groups: [
        FluxerSettingsNavGroup(
          label: 'User settings',
          items: [
            FluxerSettingsNavItem(
              label: 'My account',
              icon: PhosphorIconsBold.user,
              onTap: () {},
            ),
            FluxerSettingsNavItem(
              label: 'Log out',
              icon: PhosphorIconsBold.signOut,
              onTap: () {},
              isDanger: true,
            ),
          ],
        ),
      ],
    ),
  );
}
