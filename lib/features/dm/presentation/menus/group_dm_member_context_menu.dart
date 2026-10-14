import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/dm/domain/group_dm_utils.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GroupDmMemberContextMenu {
  GroupDmMemberContextMenu._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required Offset position,
    required String channelId,
    required String? ownerId,
    required String userId,
    required String displayName,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool canRemove = canRemoveGroupDmMember(
      ownerId: ownerId,
      currentUserId: ref.read(currentUserIdProvider),
      memberId: userId,
    );
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) => <Widget>[
        FluxerMenuItem(
          label: l10n.userProfileCopyUserId,
          icon: PhosphorIconsFill.identificationCard,
          onPressed: () async {
            close();
            await copyToClipboard(context: menuContext, value: userId);
          },
        ),
        if (canRemove) ...<Widget>[
          const FluxerMenuDivider(),
          FluxerMenuItem(
            label: l10n.groupDmRemoveFromGroup,
            icon: PhosphorIconsFill.userMinus,
            isDanger: true,
            onPressed: () {
              close();
              unawaited(
                _confirmRemove(
                  context,
                  ref,
                  channelId: channelId,
                  userId: userId,
                  displayName: displayName,
                ),
              );
            },
          ),
        ],
      ],
    );
  }

  static Future<void> _confirmRemove(
    BuildContext context,
    WidgetRef ref, {
    required String channelId,
    required String userId,
    required String displayName,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerConfirmModal.show(
      context,
      title: l10n.groupDmRemoveFromGroup,
      description: l10n.groupDmRemoveFromGroupConfirm(displayName),
      confirmLabel: l10n.groupDmRemoveFromGroupAction,
      isDanger: true,
      onConfirm: () => unawaited(
        _remove(
          ref,
          l10n,
          channelId: channelId,
          userId: userId,
          displayName: displayName,
        ),
      ),
    );
  }

  static Future<void> _remove(
    WidgetRef ref,
    FluxerLocalizations l10n, {
    required String channelId,
    required String userId,
    required String displayName,
  }) async {
    final Toast toasts = ref.read(toastProvider.notifier);
    try {
      await ref
          .read(dmRepositoryProvider)
          .removeGroupDmMember(channelId: channelId, userId: userId);
      toasts.show(
        FluxerToast(
          message: l10n.groupDmRemovedFromGroup,
          variant: FluxerToastVariant.success,
        ),
      );
    } on Object catch (e, st) {
      talker.error('[GroupDmMemberContextMenu] remove failed: $e', e, st);
      toasts.show(
        FluxerToast(
          message: l10n.groupDmRemoveFromGroupFailed(displayName),
          variant: FluxerToastVariant.danger,
        ),
      );
    }
  }
}
