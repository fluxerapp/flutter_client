import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_domain_icon.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountRow extends StatelessWidget {
  const AccountRow({
    required this.account,
    required this.isCurrent,
    required this.onTap,
    required this.onSignOut,
    super.key,
  });

  final StoredAccount account;
  final bool isCurrent;
  final VoidCallback onTap;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return FluxerTappable(
      onTap: onTap,
      builder: (context, states) {
        final isHovered = states.contains(WidgetState.hovered);

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: layout.s3,
            vertical: layout.s2,
          ),
          decoration: BoxDecoration(
            color: isHovered
                ? colors.backgroundTertiary
                : colors.backgroundSecondary,
            borderRadius: layout.radiusMd,
            border: Border.all(color: colors.borderColor),
          ),
          child: Row(
            children: [
              FluxerAvatar.user(
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: account.userId,
                  hash: account.avatar,
                ),
                fallbackText: account.displayName,
                size: 36,
                showStatus: false,
                userId: account.userId,
              ),
              SizedBox(width: layout.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      account.identifier,
                      style: textStyles.bodyMedium.copyWith(
                        color: colors.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        InstanceDomainIcon(
                          isOfficial: account.isOfficialInstance,
                        ),
                        SizedBox(width: layout.s1),
                        Expanded(
                          child: Text(
                            account.instanceDomain,
                            style: textStyles.bodySmall.copyWith(
                              color: colors.textTertiary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (!account.isValid)
                      Text(
                        l10n.accountExpired,
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textDanger,
                        ),
                      ),
                    if (account.isValid && isCurrent)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            PhosphorIconsFill.checkCircle,
                            size: 12,
                            color: colors.textPositive,
                          ),
                          SizedBox(width: layout.s1),
                          Text(
                            l10n.accountActive,
                            style: textStyles.bodySmall.copyWith(
                              color: colors.textPositive,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              _MenuButton(l10n: l10n, onSignOut: onSignOut),
            ],
          ),
        );
      },
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.l10n, required this.onSignOut});

  final FluxerLocalizations l10n;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return FluxerTappable(
      semanticLabel: l10n.accountOverflowMenu,
      onTap: () {
        final renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox == null) {
          return;
        }

        final position = renderBox.localToGlobal(
          Offset(0, renderBox.size.height),
        );

        unawaited(
          FluxerActionMenu.show(
            context,
            position: position,
            builder: (context, close) => [
              FluxerMenuItem(
                label: l10n.signOut,
                icon: PhosphorIconsBold.signOut,
                isDanger: true,
                onPressed: () {
                  close();
                  onSignOut();
                },
              ),
            ],
          ),
        );
      },
      builder: (context, states) {
        return SizedBox(
          width: layout.s8,
          height: layout.s8,
          child: Center(
            child: Icon(
              PhosphorIconsBold.dotsThreeVertical,
              size: 18,
              color: colors.textTertiary,
            ),
          ),
        );
      },
    );
  }
}
