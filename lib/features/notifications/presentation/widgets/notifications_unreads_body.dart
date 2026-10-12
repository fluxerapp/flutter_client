import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_empty_state.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_skeleton.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_channel_inbox_card.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/ui/refresh/fluxer_refresh_scroll_view.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NotificationsUnreadsBody extends ConsumerWidget {
  const NotificationsUnreadsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerColorTheme colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<List<UnreadInboxEntry>> entriesAsync = ref.watch(
      unreadInboxChannelListProvider,
    );

    Future<void> refreshUnreadInbox() async {
      ref.invalidate(unreadInboxChannelListProvider);
      await ref.read(unreadInboxChannelListProvider.future);
    }

    return entriesAsync.when(
      skipLoadingOnReload: true,
      skipLoadingOnRefresh: true,
      data: (List<UnreadInboxEntry> list) {
        if (list.isEmpty) {
          return FluxerRefreshScrollView(
            onRefresh: refreshUnreadInbox,
            slivers: const <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: _UnreadsEmptyState(),
              ),
            ],
          );
        }
        return FluxerRefreshScrollView(
          onRefresh: refreshUnreadInbox,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 12),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext _, int i) => UnreadChannelInboxCard(
                    key: ValueKey<String>(list[i].channelId),
                    entry: list[i],
                  ),
                  childCount: list.length,
                  findChildIndexCallback: (Key key) {
                    if (key is! ValueKey<String>) {
                      return null;
                    }
                    final int index = list.indexWhere(
                      (UnreadInboxEntry e) => e.channelId == key.value,
                    );
                    return index < 0 ? null : index;
                  },
                ),
              ),
            ),
          ],
        );
      },
      loading: () => FluxerRefreshScrollView(
        onRefresh: refreshUnreadInbox,
        slivers: const <Widget>[
          SliverToBoxAdapter(child: NotificationsSkeletonList()),
        ],
      ),
      error: (Object err, StackTrace _) => FluxerRefreshScrollView(
        onRefresh: refreshUnreadInbox,
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      userFacingErrorMessage(err, l10n.networkErrorMessage),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.statusDanger,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () => unawaited(refreshUnreadInbox()),
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UnreadsEmptyState extends StatelessWidget {
  const _UnreadsEmptyState();

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return NotificationsEmptyState(
      icon: PhosphorIconsBold.sparkle,
      title: l10n.notificationsNoUnreadTitle,
      body: l10n.notificationsNoUnreadBody,
    );
  }
}
