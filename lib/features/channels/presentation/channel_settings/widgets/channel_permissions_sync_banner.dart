import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class ChannelPermissionsSyncBanner extends StatelessWidget {
  const ChannelPermissionsSyncBanner({
    required this.isSyncedWithParent,
    required this.parentChannel,
    required this.canEdit,
    required this.onSyncWithParent,
    super.key,
  });

  final bool isSyncedWithParent;
  final Channel parentChannel;
  final bool canEdit;
  final VoidCallback onSyncWithParent;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Color statusColor = isSyncedWithParent
        ? context.colors.statusOnline
        : context.colors.statusIdle;
    final String prefix = isSyncedWithParent
        ? l10n.channelSettingsPermissionsSyncedWithParentPrefix
        : l10n.channelSettingsPermissionsNotSyncedWithParentPrefix;
    final String suffix = isSyncedWithParent
        ? l10n.channelSettingsPermissionsSyncedWithParentSuffix
        : l10n.channelSettingsPermissionsNotSyncedWithParentSuffix;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(
            TextSpan(
              style: context.textStyles.bodySmall.copyWith(color: statusColor),
              children: <InlineSpan>[
                TextSpan(text: prefix),
                TextSpan(
                  text: parentChannel.name,
                  style: context.textStyles.bodySmall.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: suffix),
              ],
            ),
          ),
          if (!isSyncedWithParent) ...<Widget>[
            const SizedBox(height: 8),
            FluxerButton.secondary(
              onPressed: canEdit ? onSyncWithParent : null,
              label: l10n.channelSettingsPermissionsSyncWithCategory,
              size: FluxerButtonSize.small,
              fitContent: true,
            ),
          ],
        ],
      ),
    );
  }
}
