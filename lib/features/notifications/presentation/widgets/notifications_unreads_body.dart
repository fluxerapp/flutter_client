import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_view.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_empty_state.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_list_states.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_channel_inbox_card.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/ui/refresh/fluxer_refresh_scroll_view.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kLoadMoreExtent = 600;

class NotificationsUnreadsBody extends ConsumerStatefulWidget {
  const NotificationsUnreadsBody({super.key, this.selected = true});

  final bool selected;

  @override
  ConsumerState<NotificationsUnreadsBody> createState() =>
      _NotificationsUnreadsBodyState();
}

class _NotificationsUnreadsBodyState
    extends ConsumerState<NotificationsUnreadsBody> {
  late final AppLifecycleListener _lifecycle;
  late UnreadInboxView _view;
  bool _active = false;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(onShow: _syncActive, onHide: _syncActive);
    _view = ref.read(unreadInboxViewProvider);
    ref
      ..listenManual<UnreadInboxView>(unreadInboxViewProvider, (
        UnreadInboxView? _,
        UnreadInboxView next,
      ) {
        _active = false;
        setState(() => _view = next);
        _feedLive(ref.read(unreadInboxChannelListProvider));
        _syncActive();
      })
      ..listenManual<AsyncValue<List<UnreadInboxEntry>>>(
        unreadInboxChannelListProvider,
        (_, AsyncValue<List<UnreadInboxEntry>> next) => _feedLive(next),
        fireImmediately: true,
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncActive();
  }

  @override
  void didUpdateWidget(NotificationsUnreadsBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncActive();
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    _view.leave();
    super.dispose();
  }

  void _syncActive() {
    if (!mounted) {
      return;
    }
    final AppLifecycleState? lifecycle = WidgetsBinding.instance.lifecycleState;
    final bool active =
        widget.selected &&
        TickerMode.valuesOf(context).enabled &&
        (lifecycle == null || lifecycle == AppLifecycleState.resumed);
    if (active == _active) {
      return;
    }
    _active = active;
    if (active) {
      _view.enter();
    } else {
      _view.leave();
    }
  }

  void _feedLive(AsyncValue<List<UnreadInboxEntry>> next) {
    final List<UnreadInboxEntry>? live = next.value;
    if (live != null) {
      _view.updateLive(_withoutThreadOnly(live));
    }
  }

  static List<UnreadInboxEntry> _withoutThreadOnly(
    List<UnreadInboxEntry> live,
  ) => live.where((UnreadInboxEntry entry) => !entry.isThreadOnly).toList();

  Future<void> _refresh() async {
    final UnreadInboxView view = _view;
    ref.read(unreadInboxCardCacheProvider).clear();
    ref.invalidate(unreadInboxChannelListProvider);
    final List<UnreadInboxEntry> live;
    try {
      live = await ref.read(unreadInboxChannelListProvider.future);
    } on Object catch (_) {
      return;
    }
    await view.refresh(_withoutThreadOnly(live));
  }

  bool _onScroll(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    if (metrics.axis == Axis.vertical &&
        metrics.extentAfter < _kLoadMoreExtent) {
      unawaited(_view.loadMore());
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _view,
      builder: (BuildContext context, Widget? _) => _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final UnreadInboxView view = _view;
    final List<UnreadInboxRow> rows = view.rows;
    final Object? error = view.error;
    return NotificationListener<ScrollNotification>(
      onNotification: _onScroll,
      child: FluxerRefreshScrollView(
        onRefresh: _refresh,
        slivers: <Widget>[
          if (rows.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: !view.loaded
                  ? const NotificationsLoadingState()
                  : error != null
                  ? _UnreadsError(
                      error: error,
                      onRetry: () => unawaited(_refresh()),
                    )
                  : const _UnreadsEmptyState(),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 12),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext _, int i) {
                    if (i == rows.length) {
                      return const NotificationsLoadMoreFooter();
                    }
                    final UnreadInboxRow row = rows[i];
                    return UnreadChannelInboxCard(
                      key: ValueKey<String>(row.channelId),
                      row: row,
                      onCollapsedChanged: (bool collapsed) => view.setCollapsed(
                        row.channelId,
                        collapsed: collapsed,
                      ),
                      onDismissed: () => view.dismiss(row.channelId),
                    );
                  },
                  childCount: rows.length + (view.hasMore ? 1 : 0),
                  findChildIndexCallback: (Key key) {
                    if (key is! ValueKey<String>) {
                      return null;
                    }
                    final int index = rows.indexWhere(
                      (UnreadInboxRow row) => row.channelId == key.value,
                    );
                    return index < 0 ? null : index;
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _UnreadsError extends StatelessWidget {
  const _UnreadsError({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              userFacingErrorMessage(error, l10n.networkErrorMessage),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: context.colors.statusDanger,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            FilledButton(onPressed: onRetry, child: Text(l10n.retry)),
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
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return NotificationsEmptyState(
      icon: PhosphorIconsBold.sparkle,
      title: l10n.notificationsNoUnreadTitle,
      body: l10n.notificationsNoUnreadBody,
    );
  }
}
