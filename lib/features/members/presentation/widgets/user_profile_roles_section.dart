import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/domain/member_role_management.dart';
import 'package:fluxer_app/features/members/presentation/sheets/no_roles_available_sheet.dart';
import 'package:fluxer_app/features/members/presentation/widgets/manage_member_roles_picker.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_role_badge.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserProfileRolesSection extends ConsumerWidget {
  const UserProfileRolesSection({
    required this.guildId,
    required this.userId,
    required this.memberRoles,
    required this.memberRoleIds,
    required this.allGuildRoles,
    required this.canManageRoles,
    required this.isGuildOwner,
    required this.viewerHighestRole,
    super.key,
  });

  final String guildId;
  final String userId;
  final List<MemberRole> memberRoles;
  final Set<String> memberRoleIds;
  final List<MemberRole> allGuildRoles;
  final bool canManageRoles;
  final bool isGuildOwner;
  final MemberRole? viewerHighestRole;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!shouldShowMemberRolesSection(
      memberRoles: memberRoles,
      canManageRoles: canManageRoles,
    )) {
      return const SizedBox.shrink();
    }

    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusXl,
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    l10n.userProfileRoles,
                    style: textStyles.label.copyWith(
                      color: colors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (canManageRoles)
                  Tooltip(
                    message: l10n.memberRoleAdd,
                    child: Semantics(
                      button: true,
                      label: l10n.memberRoleAdd,
                      child: FluxerGestureDetector(
                        onTapDown: (TapDownDetails details) => _handleAddRole(
                          context,
                          ref,
                          details.globalPosition,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: PhosphorIcon(
                            PhosphorIconsBold.plus,
                            size: 16,
                            color: colors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: layout.s1),
            if (memberRoles.isEmpty)
              Text(
                l10n.userProfileNoRolesInCommunity,
                style: textStyles.bodySmall.copyWith(
                  color: colors.textChat,
                  fontSize: 14,
                ),
              )
            else
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: memberRoles
                    .map(
                      (MemberRole role) => MemberRoleBadge(
                        role: role,
                        guildId: guildId,
                        userId: userId,
                        canRemove:
                            canManageRoles &&
                            canManageMemberRole(
                              role: role,
                              guildId: guildId,
                              isGuildOwner: isGuildOwner,
                              canManageRoles: canManageRoles,
                              viewerHighestRole: viewerHighestRole,
                            ),
                      ),
                    )
                    .toList(growable: false),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleAddRole(
    BuildContext context,
    WidgetRef ref,
    Offset tapPosition,
  ) async {
    final bool hasAssignableRoles = guildHasAssignableRoles(
      guildId: guildId,
      allGuildRoles: allGuildRoles,
    );
    if (!hasAssignableRoles) {
      await NoRolesAvailableSheet.show(context, guildId: guildId);
      return;
    }

    final Offset? position = isMobileLayout(context) ? null : tapPosition;
    await ManageMemberRolesPicker.show(
      context,
      ref,
      position: position,
      guildId: guildId,
      userId: userId,
      allGuildRoles: allGuildRoles,
      memberRoleIds: memberRoleIds,
      canManageRoles: canManageRoles,
      isGuildOwner: isGuildOwner,
      viewerHighestRole: viewerHighestRole,
    );
  }
}
