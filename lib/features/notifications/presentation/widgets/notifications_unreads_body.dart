import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_snapshot.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_empty_state.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_skeleton.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_channel_inbox_card.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/ui/refresh/fluxer_refresh_scroll_view.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NotificationsUnreadsBody extends ConsumerStatefulWidget {
  const NotificationsUnreadsBody({super.key});

  @override
  ConsumerState<NotificationsUnreadsBody> createState() =>
      _NotificationsUnreadsBodyState();
}

class _NotificationsUnreadsBodyState
    extends ConsumerState<NotificationsUnreadsBody> {
  UnreadInboxSnapshot? _snapshot;
  List<UnreadInboxEntry>? _live;
  List<UnreadInboxEntry> _rows = const <UnreadInboxEntry>[];
  Object? _error;
  bool _hasShownFrozenRows = false;
  bool _active = false;
  int _refreshEpoch = 0;
  Timer? _cooldownTimer;

  @override
  void initState() {
    super.initState();
    ref
      ..listenManual<AsyncValue<List<UnreadInboxEntry>>>(
        unreadInboxChannelListProvider,
        (_, AsyncValue<List<UnreadInboxEntry>> next) => _onLive(next),
        fireImmediately: true,
      )
      ..listenManual<NotificationsInboxTab>(notificationsInboxSegmentProvider, (
        NotificationsInboxTab? previous,
        NotificationsInboxTab next,
      ) {
        if (next == NotificationsInboxTab.unreads && previous != next) {
          _refreeze();
        }
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool active = TickerMode.valuesOf(context).enabled;
    if (active && !_active) {
      _refreeze();
    }
    _active = active;
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  void _onLive(AsyncValue<List<UnreadInboxEntry>> next) {
    final List<UnreadInboxEntry>? live = next.value;
    final Object? error = next.hasError && live == null ? next.error : null;
    if (live == null) {
      if (error != _error && mounted) {
        setState(() => _error = error);
      }
      return;
    }
    final bool first = _live == null;
    _live = live;
    _error = null;
    _reconcile(forceRebuild: first);
  }

  void _refreeze() {
    _snapshot = null;
    _hasShownFrozenRows = false;
    _cooldownTimer?.cancel();
    if (_live != null) {
      _reconcile();
    }
  }

  void _reconcile({bool forceRebuild = false}) {
    final List<UnreadInboxEntry> live = _live!;
    final DateTime now = DateTime.now();
    UnreadInboxSnapshot snapshot = _snapshot ??= UnreadInboxSnapshot(
      live,
      takenAt: now,
    );
    List<UnreadInboxEntry> rows = snapshot.select(live);
    if (rows.isNotEmpty) {
      _hasShownFrozenRows = true;
    } else if (live.isEmpty) {
      snapshot = _snapshot = UnreadInboxSnapshot(live, takenAt: now);
    } else {
      final Duration heldFor = now.difference(snapshot.takenAt);
      if (_hasShownFrozenRows && heldFor < kUnreadInboxRefreezeCooldown) {
        _cooldownTimer?.cancel();
        _cooldownTimer = Timer(kUnreadInboxRefreezeCooldown - heldFor, () {
          if (mounted && _live != null) {
            _reconcile();
          }
        });
      } else {
        snapshot = _snapshot = UnreadInboxSnapshot(live, takenAt: now);
        _hasShownFrozenRows = false;
        rows = snapshot.select(live);
      }
    }
    if (!forceRebuild && sameUnreadInboxRows(rows, _rows)) {
      return;
    }
    _rows = rows;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _refresh() async {
    ref.read(unreadInboxCardCacheProvider).clear();
    ref.invalidate(unreadInboxChannelListProvider);
    try {
      _live = await ref.read(unreadInboxChannelListProvider.future);
    } on Object catch (_) {
      return;
    }
    if (!mounted) {
      return;
    }
    _refreshEpoch++;
    _snapshot = null;
    _hasShownFrozenRows = false;
    _cooldownTimer?.cancel();
    _reconcile(forceRebuild: true);
  }

  @override
  Widget build(BuildContext context) {
    final List<UnreadInboxEntry> rows = _rows;
    if (_live == null) {
      final Object? error = _error;
      return FluxerRefreshScrollView(
        onRefresh: _refresh,
        slivers: <Widget>[
          if (error == null)
            const SliverToBoxAdapter(child: NotificationsSkeletonList())
          else
            SliverFillRemaining(
              hasScrollBody: false,
              child: _UnreadsError(
                error: error,
                onRetry: () => unawaited(_refresh()),
              ),
            ),
        ],
      );
    }
    if (rows.isEmpty) {
      return FluxerRefreshScrollView(
        onRefresh: _refresh,
        slivers: const <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: _UnreadsEmptyState(),
          ),
        ],
      );
    }
    return FluxerRefreshScrollView(
      onRefresh: _refresh,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 12),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext _, int i) => UnreadChannelInboxCard(
                key: ValueKey<String>(rows[i].channelId),
                entry: rows[i],
                refreshEpoch: _refreshEpoch,
              ),
              childCount: rows.length,
              findChildIndexCallback: (Key key) {
                if (key is! ValueKey<String>) {
                  return null;
                }
                final int index = rows.indexWhere(
                  (UnreadInboxEntry e) => e.channelId == key.value,
                );
                return index < 0 ? null : index;
              },
            ),
          ),
        ),
      ],
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
