import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/color_utils.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_role_color_dot.dart';
import 'package:fluxer_app/features/members/utils/member_role_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/role_color_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MemberRoleBadge extends ConsumerWidget {
  const MemberRoleBadge({
    required this.role,
    required this.guildId,
    required this.userId,
    required this.canRemove,
    super.key,
  });

  final MemberRole role;
  final String guildId;
  final String userId;
  final bool canRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    final String removeLabel = l10n.memberRoleRemove(role.name);
    final int roleColorInt = guildRoleColorInt(role.color);
    final Color contrastColor = ColorUtils.bestContrastColor(roleColorInt);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        border: Border.all(color: colors.backgroundHeaderSecondary),
        borderRadius: BorderRadius.circular(4),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 24, maxWidth: 268),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (canRemove)
                Tooltip(
                  message: removeLabel,
                  child: Semantics(
                    button: true,
                    label: removeLabel,
                    child: InkWell(
                      onTap: () => toggleMemberRole(
                        ref,
                        guildId: guildId,
                        userId: userId,
                        roleId: role.id,
                        hasRole: true,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            MemberRoleColorDot(color: role.color, size: 12),
                            PhosphorIcon(
                              PhosphorIconsBold.x,
                              size: 10,
                              color: contrastColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: MemberRoleColorDot(color: role.color, size: 12),
                ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  role.name,
                  style: textStyles.label.copyWith(
                    color: colors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.33,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 1),
            ],
          ),
        ),
      ),
    );
  }
}
