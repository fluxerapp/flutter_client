import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/widgets/add_friend_form.dart';
import 'package:fluxer_app/shared/widgets/friend_request_sheet_item.dart';

class AddFriendSheet {
  AddFriendSheet._();

  static Future<void> show(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.addFriendSheetTitle,
      useRootNavigator: true,
      builder: (sheetContext, scrollController, close) {
        return _AddFriendSheetBody(scrollController: scrollController);
      },
    );
  }
}

class _AddFriendSheetBody extends ConsumerWidget {
  const _AddFriendSheetBody({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final friends = ref.watch(friendsListProvider).value ?? const [];
    final incoming = friends
        .where((f) => f.friendStatus == FriendStatus.pendingIncoming)
        .toList();
    final outgoing = friends
        .where((f) => f.friendStatus == FriendStatus.pendingOutgoing)
        .toList();
    final hasPendingRequests = incoming.isNotEmpty || outgoing.isNotEmpty;
    return ListView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.fromLTRB(
          context.layout.s4,
          0,
          context.layout.s4,
          context.layout.s4,
        ),
      ),
      children: [
        const AddFriendForm(),
        if (hasPendingRequests) ...[
          SizedBox(height: context.layout.s4),
          if (incoming.isNotEmpty) ...[
            _RequestsSectionHeader(
              title: l10n.addFriendIncomingRequests(incoming.length),
            ),
            SizedBox(height: context.layout.s3),
            _RequestsList(friends: incoming),
          ],
          if (outgoing.isNotEmpty) ...[
            SizedBox(height: context.layout.s6),
            _RequestsSectionHeader(
              title: l10n.addFriendOutgoingRequests(outgoing.length),
            ),
            SizedBox(height: context.layout.s3),
            _RequestsList(friends: outgoing),
          ],
        ],
      ],
    );
  }
}

class _RequestsSectionHeader extends StatelessWidget {
  const _RequestsSectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: context.colors.textPrimaryMuted,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _RequestsList extends StatelessWidget {
  const _RequestsList({required this.friends});

  final List<Friend> friends;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundTertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            for (var i = 0; i < friends.length; i++) ...[
              FriendRequestSheetItem(friend: friends[i]),
              if (i < friends.length - 1)
                Divider(
                  height: 1,
                  indent: context.layout.s4,
                  endIndent: context.layout.s4,
                  color: context.colors.backgroundHeaderSecondary.withValues(
                    alpha: 0.3,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
