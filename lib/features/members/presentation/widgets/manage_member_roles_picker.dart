import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/domain/member_role_management.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_role_checkbox_item.dart';
import 'package:fluxer_app/features/members/utils/guild_settings_path.dart';
import 'package:fluxer_app/features/members/utils/member_role_actions.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/guild_settings_modal.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ManageMemberRolesPicker {
  ManageMemberRolesPicker._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required Offset? position,
    required String guildId,
    required String userId,
    required List<MemberRole> allGuildRoles,
    required Set<String> memberRoleIds,
    required bool canManageRoles,
    required bool isGuildOwner,
    required MemberRole? viewerHighestRole,
    String? title,
  }) async {
    if (isMobileLayout(context) || position == null) {
      await ManageMemberRolesSheet.show(
        context,
        ref,
        guildId: guildId,
        userId: userId,
        allGuildRoles: allGuildRoles,
        memberRoleIds: memberRoleIds,
        canManageRoles: canManageRoles,
        isGuildOwner: isGuildOwner,
        viewerHighestRole: viewerHighestRole,
        title: title,
      );
      return;
    }

    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) {
        return <Widget>[
          _ManageMemberRolesPickerContent(
            guildId: guildId,
            userId: userId,
            allGuildRoles: allGuildRoles,
            memberRoleIds: memberRoleIds,
            canManageRoles: canManageRoles,
            isGuildOwner: isGuildOwner,
            viewerHighestRole: viewerHighestRole,
            isBottomSheet: false,
          ),
        ];
      },
    );
  }
}

class ManageMemberRolesSheet {
  ManageMemberRolesSheet._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required String guildId,
    required String userId,
    required List<MemberRole> allGuildRoles,
    required Set<String> memberRoleIds,
    required bool canManageRoles,
    required bool isGuildOwner,
    required MemberRole? viewerHighestRole,
    String? title,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: title ?? l10n.permissionManageRoles,
      useRootNavigator: true,
      initialChildSize: 0.6,
      minChildSize: 0.35,
      builder: (sheetContext, scrollController, close) {
        return ListView(
          controller: scrollController,
          padding: FluxerBottomSheet.scrollViewPadding(sheetContext),
          children: <Widget>[
            _ManageMemberRolesPickerContent(
              guildId: guildId,
              userId: userId,
              allGuildRoles: allGuildRoles,
              memberRoleIds: memberRoleIds,
              canManageRoles: canManageRoles,
              isGuildOwner: isGuildOwner,
              viewerHighestRole: viewerHighestRole,
              isBottomSheet: true,
            ),
          ],
        );
      },
    );
  }
}

class _ManageMemberRolesPickerContent extends ConsumerStatefulWidget {
  const _ManageMemberRolesPickerContent({
    required this.guildId,
    required this.userId,
    required this.allGuildRoles,
    required this.memberRoleIds,
    required this.canManageRoles,
    required this.isGuildOwner,
    required this.viewerHighestRole,
    required this.isBottomSheet,
  });

  final String guildId;
  final String userId;
  final List<MemberRole> allGuildRoles;
  final Set<String> memberRoleIds;
  final bool canManageRoles;
  final bool isGuildOwner;
  final MemberRole? viewerHighestRole;
  final bool isBottomSheet;

  @override
  ConsumerState<_ManageMemberRolesPickerContent> createState() =>
      _ManageMemberRolesPickerContentState();
}

class _ManageMemberRolesPickerContentState
    extends ConsumerState<_ManageMemberRolesPickerContent> {
  late Set<String> _memberRoleIds = Set<String>.from(widget.memberRoleIds);

  @override
  void didUpdateWidget(covariant _ManageMemberRolesPickerContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.memberRoleIds != widget.memberRoleIds) {
      _memberRoleIds = Set<String>.from(widget.memberRoleIds);
    }
  }

  Future<void> _toggleRole(MemberRole role, bool hasRole, bool enabled) async {
    if (!enabled) {
      return;
    }
    setState(() {
      if (hasRole) {
        _memberRoleIds.remove(role.id);
      } else {
        _memberRoleIds.add(role.id);
      }
    });
    await toggleMemberRole(
      ref,
      guildId: widget.guildId,
      userId: widget.userId,
      roleId: role.id,
      hasRole: hasRole,
    );
  }

  void _openGuildRolesSettings() {
    unawaited(
      GuildSettingsModal.show(
        context,
        guildId: widget.guildId,
        initialTab: GuildSettingsTab.roles,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String rolesSettingsPath = formatGuildSettingsRolesPath(l10n);
    final List<MemberRole> assignableRoles = resolveAssignableRoles(
      guildId: widget.guildId,
      allGuildRoles: widget.allGuildRoles,
    );

    if (assignableRoles.isEmpty) {
      final Widget emptyItem = widget.isBottomSheet
          ? FluxerBottomSheetMenuItem(
              label: l10n.memberRolesNoRolesYet(rolesSettingsPath),
              icon: PhosphorIconsFill.plus,
              onTap: _openGuildRolesSettings,
            )
          : FluxerMenuItem(
              label: l10n.memberRolesNoRolesYet(rolesSettingsPath),
              icon: PhosphorIconsFill.plus,
              onPressed: _openGuildRolesSettings,
            );
      return emptyItem;
    }

    final Iterable<MemberRole> visibleRoles = widget.canManageRoles
        ? assignableRoles
        : assignableRoles.where(
            (MemberRole role) => _memberRoleIds.contains(role.id),
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: visibleRoles
          .map((MemberRole role) {
            final bool hasRole = _memberRoleIds.contains(role.id);
            final bool canToggle =
                widget.canManageRoles &&
                canManageMemberRole(
                  role: role,
                  guildId: widget.guildId,
                  isGuildOwner: widget.isGuildOwner,
                  canManageRoles: widget.canManageRoles,
                  viewerHighestRole: widget.viewerHighestRole,
                );

            return MemberRoleCheckboxItem(
              label: role.name,
              roleColor: role.color,
              isChecked: hasRole,
              enabled: canToggle,
              isBottomSheet: widget.isBottomSheet,
              showCheckbox: widget.canManageRoles,
              onTap: widget.canManageRoles
                  ? () => _toggleRole(role, hasRole, canToggle)
                  : () {},
            );
          })
          .toList(growable: false),
    );
  }
}
