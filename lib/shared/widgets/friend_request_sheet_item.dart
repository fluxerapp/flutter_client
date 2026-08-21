import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FriendRequestSheetItem extends ConsumerWidget {
  const FriendRequestSheetItem({required this.friend, super.key});

  final Friend friend;

  bool get _isIncoming => friend.friendStatus == FriendStatus.pendingIncoming;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final statusText = _isIncoming
        ? l10n.addFriendIncomingStatus
        : l10n.addFriendOutgoingStatus;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.layout.s4,
        vertical: context.layout.s3,
      ),
      child: Row(
        children: [
          FluxerAvatar.user(
            fallbackText: friend.displayName,
            userId: friend.id,
            imageUrl: FluxerMediaUrl.userAvatar(
              userId: friend.id,
              hash: friend.avatar,
              animated: true,
            ),
            avatarColor: friend.avatarColor,
            status: friend.status,
          ),
          SizedBox(width: context.layout.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  friend.displayName,
                  style: context.textStyles.channelName,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  statusText,
                  style: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textTertiary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          FluxerButton.circleAlt(
            icon: PhosphorIconsBold.dotsThreeVertical,
            size: FluxerButtonSize.compact,
            onPressed: () => unawaited(_showMenu(context, ref)),
          ),
        ],
      ),
    );
  }

  Future<void> _showMenu(BuildContext context, WidgetRef ref) async {
    final l10n = FluxerLocalizations.of(context);
    await FluxerBottomSheet.show<void>(
      context,
      variant: FluxerBottomSheetVariant.menu,
      showDragHandle: false,
      builder: (sheetContext, close) {
        final groups = <Widget>[
          FluxerMenuGroup(
            children: [
              FluxerBottomSheetMenuItem(
                label: l10n.addFriendViewProfile,
                icon: PhosphorIconsFill.user,
                onTap: () {
                  close();
                  unawaited(
                    FluxerUserProfileSheet.show(context, userId: friend.id),
                  );
                },
              ),
            ],
          ),
          if (_isIncoming)
            FluxerMenuGroup(
              children: [
                FluxerBottomSheetMenuItem(
                  label: l10n.addFriendAccept,
                  icon: PhosphorIconsBold.check,
                  onTap: () {
                    close();
                    unawaited(_confirmAccept(context, ref));
                  },
                ),
                FluxerBottomSheetMenuItem(
                  label: l10n.addFriendIgnore,
                  icon: PhosphorIconsBold.x,
                  isDanger: true,
                  onTap: () {
                    close();
                    unawaited(_confirmIgnore(context, ref));
                  },
                ),
              ],
            )
          else
            FluxerMenuGroup(
              children: [
                FluxerBottomSheetMenuItem(
                  label: l10n.addFriendCancelRequest,
                  icon: PhosphorIconsBold.x,
                  isDanger: true,
                  onTap: () {
                    close();
                    unawaited(_cancelRequest(ref));
                  },
                ),
              ],
            ),
        ];
        return FluxerBottomSheetContent(
          scrollable: false,
          child: FluxerBottomSheetGroupColumn(children: groups),
        );
      },
    );
  }

  Future<void> _confirmAccept(BuildContext context, WidgetRef ref) async {
    final l10n = FluxerLocalizations.of(context);
    await FluxerConfirmModal.show(
      context,
      title: l10n.addFriendAcceptTitle,
      description: l10n.addFriendAcceptConfirmDescription(friend.username),
      confirmLabel: l10n.addFriendAccept,
      onConfirm: () => unawaited(_acceptRequest(ref)),
    );
  }

  Future<void> _confirmIgnore(BuildContext context, WidgetRef ref) async {
    final l10n = FluxerLocalizations.of(context);
    await FluxerConfirmModal.show(
      context,
      title: l10n.addFriendIgnoreTitle,
      description: l10n.addFriendIgnoreConfirmDescription(friend.displayName),
      confirmLabel: l10n.addFriendIgnore,
      isDanger: true,
      onConfirm: () => unawaited(_cancelRequest(ref)),
    );
  }

  Future<void> _acceptRequest(WidgetRef ref) async {
    final l10n = FluxerLocalizations.of(ref.context);
    try {
      await ref.read(friendRepositoryProvider).acceptFriendRequest(friend.id);
    } on Exception catch (_) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.dmAcceptFriendRequestFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Future<void> _cancelRequest(WidgetRef ref) async {
    final l10n = FluxerLocalizations.of(ref.context);
    try {
      await ref.read(friendRepositoryProvider).removeRelationship(friend.id);
    } on Exception catch (_) {
      final String message = _isIncoming
          ? l10n.dmIgnoreFriendRequestFailed
          : l10n.addFriendCancelRequestFailed;
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(message: message, variant: FluxerToastVariant.danger),
          );
    }
  }
}
