import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_channel_inbox_card.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/ui/refresh/fluxer_refresh_scroll_view.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: entriesAsync.when(
        skipLoadingOnReload: false,
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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext _, int i) => UnreadChannelInboxCard(
                    key: ValueKey<String>(list[i].channelId),
                    entry: list[i],
                  ),
                  childCount: list.length,
                ),
              ),
            ],
          );
        },
        loading: () => FluxerRefreshScrollView(
          onRefresh: refreshUnreadInbox,
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: FluxerLoadingSpinner(color: colors.brandPrimary),
              ),
            ),
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
                        '$err',
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
      ),
    );
  }
}

class _UnreadsEmptyState extends StatelessWidget {
  const _UnreadsEmptyState();

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              PhosphorIconsBold.sparkle,
              size: 80,
              color: colors.textPrimaryMuted,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.notificationsNoUnreadTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.notificationsNoUnreadBody,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: colors.textPrimaryMuted),
            ),
          ],
        ),
      ),
    );
  }
}
