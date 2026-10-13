import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_sticker_image.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/notifications/data/mention_header_loader.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mention_inbox_card.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mentions_empty_state.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mentions_end_footer.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_list_states.dart';
import 'package:fluxer_app/features/notifications/providers/notification_stream_providers.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/ui/refresh/fluxer_refresh_scroll_view.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kLoadMoreScrollThreshold = 0.8;

class NotificationsMentionsBody extends ConsumerStatefulWidget {
  const NotificationsMentionsBody({super.key, this.selected = true});

  final bool selected;

  @override
  ConsumerState<NotificationsMentionsBody> createState() =>
      _NotificationsMentionsBodyState();
}

class _NotificationsMentionsBodyState
    extends ConsumerState<NotificationsMentionsBody> {
  final ScrollController _scroll = ScrollController();
  final Map<String, Message?> _messageById = <String, Message?>{};
  final Set<String> _skippedMessageIds = <String>{};
  final Set<String> _removedMessageIds = <String>{};
  final Map<String, MentionHeader> _mentionHeaderByChannelId =
      <String, MentionHeader>{};

  final Map<String, String> _guildIdPreviewByChannelId = <String, String>{};

  late final AppLifecycleListener _lifecycle;
  late MentionInboxVisitState _memory = ref.read(mentionInboxVisitProvider);
  int _hydrateGeneration = 0;
  bool _feedHydrationPending = false;
  Completer<void>? _hydrated;
  bool _active = false;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(onShow: _syncActive, onHide: _syncActive);
    _scroll.addListener(_onScrollNearEnd);
    ref
      ..listenManual<AsyncValue<List<drift_db.NotificationMentionFeedData>>>(
        notificationMentionFeedStreamProvider,
        (
          AsyncValue<List<drift_db.NotificationMentionFeedData>>? previous,
          AsyncValue<List<drift_db.NotificationMentionFeedData>> next,
        ) {
          final List<drift_db.NotificationMentionFeedData>? data =
              next.asData?.value;
          if (data != null && mounted) {
            unawaited(_reconcile(data));
          }
        },
        fireImmediately: true,
      )
      ..listenManual<MentionInboxVisitState>(mentionInboxVisitProvider, (
        _,
        MentionInboxVisitState next,
      ) {
        _active = false;
        setState(() => _memory = next);
        _syncActive();
      })
      ..listenManual<MentionSeenBoundaryState>(mentionSeenBoundaryProvider, (
        _,
        MentionSeenBoundaryState next,
      ) {
        if (!_memory.boundaryResolved && next.loaded && mounted) {
          setState(_resolveVisitBoundary);
        }
      })
      ..listenManual<MentionFeedUiState>(mentionFeedCoordinatorProvider, (
        MentionFeedUiState? previous,
        MentionFeedUiState next,
      ) {
        if ((previous?.busy ?? false) && !next.busy && mounted) {
          final List<drift_db.NotificationMentionFeedData>? data = ref
              .read(notificationMentionFeedStreamProvider)
              .value;
          if (data != null) {
            unawaited(_reconcile(data, reload: true));
          }
        }
      });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !ref.read(mentionFeedCoordinatorProvider).fetched) {
        unawaited(_refresh());
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncActive();
  }

  @override
  void didUpdateWidget(NotificationsMentionsBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncActive();
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
    if (!active) {
      _memory.visit.leave();
      return;
    }
    if (_memory.visit.enter()) {
      _startVisit();
    } else {
      _markNewestSeen();
    }
  }

  void _startVisit() {
    _memory.start();
    _pinCeiling();
    _resolveVisitBoundary();
  }

  void _resolveVisitBoundary() {
    final MentionSeenBoundaryState seen = ref.read(mentionSeenBoundaryProvider);
    if (!seen.loaded) {
      return;
    }
    _memory
      ..boundaryId = seen.messageId
      ..boundaryResolved = true;
    _markNewestSeen();
  }

  void _pinCeiling() {
    if (_memory.ceilingId != null ||
        !ref.read(mentionFeedCoordinatorProvider).fetched) {
      return;
    }
    final List<drift_db.NotificationMentionFeedData>? rows = ref
        .read(notificationMentionFeedStreamProvider)
        .value;
    if (rows == null) {
      return;
    }
    for (final drift_db.NotificationMentionFeedData row in _visibleRows(rows)) {
      if (compareSnowflakeIds(row.messageId, _memory.ceilingId) > 0) {
        _memory.ceilingId = row.messageId;
      }
    }
  }

  void _markNewestSeen() {
    if (!_active || !_memory.boundaryResolved || _feedHydrationPending) {
      return;
    }
    final List<drift_db.NotificationMentionFeedData>? rows = ref
        .read(notificationMentionFeedStreamProvider)
        .value;
    if (rows == null) {
      return;
    }
    String? newest;
    for (final drift_db.NotificationMentionFeedData row in _visibleRows(rows)) {
      if (compareSnowflakeIds(row.messageId, newest) > 0) {
        newest = row.messageId;
      }
    }
    if (newest == null) {
      return;
    }
    _memory.boundaryId ??= newest;
    ref.read(mentionSeenBoundaryProvider.notifier).markSeen(newest);
  }

  bool _isNew(String messageId) {
    final String? boundary = _memory.boundaryId;
    return _memory.boundaryResolved &&
        boundary != null &&
        compareSnowflakeIds(messageId, boundary) > 0;
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    if (_active) {
      _memory.visit.leave();
    }
    _scroll
      ..removeListener(_onScrollNearEnd)
      ..dispose();
    super.dispose();
  }

  Future<void> _refresh() {
    return ref.read(mentionFeedCoordinatorProvider.notifier).refresh();
  }

  Future<void> _pullToRefresh() async {
    await _refresh();
    if (_feedHydrationPending) {
      await (_hydrated ??= Completer<void>()).future;
    }
    if (!mounted) {
      return;
    }
    _memory.visit.renew();
    setState(_startVisit);
  }

  Future<void> _reconcile(
    List<drift_db.NotificationMentionFeedData> rows, {
    bool reload = false,
  }) async {
    final int ticket = ++_hydrateGeneration;
    if (rows.isNotEmpty) {
      final bool wasPending = _feedHydrationPending;
      _feedHydrationPending = true;
      if (!wasPending && mounted) {
        setState(() {});
      }
    }
    try {
      final drift_db.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
      final Set<String> wantedIds = <String>{
        for (final drift_db.NotificationMentionFeedData r in rows) r.messageId,
      };
      _messageById.removeWhere(
        (String k, Message? _) => !wantedIds.contains(k),
      );
      _removedMessageIds.retainAll(wantedIds);
      _memory.readThisVisit.retainAll(wantedIds);
      final Set<String> skipped = <String>{};
      final Set<String> retainedChannelIds = <String>{};

      for (final drift_db.NotificationMentionFeedData r in rows) {
        if (reload || _messageById[r.messageId] == null) {
          final drift_db.Message? row = await db.messageDao.getMessage(
            r.messageId,
          );
          _messageById[r.messageId] = row == null ? null : Message.fromRow(row);
        }
        if (ticket != _hydrateGeneration || !mounted) {
          return;
        }
        final Message? msg = _messageById[r.messageId];
        final bool reachable = msg != null
            ? await isChannelReachable(db, msg)
            : await isBareChannelReachable(db, r.channelId);
        if (!reachable) {
          skipped.add(r.messageId);
          continue;
        }
        if (msg != null) {
          retainedChannelIds.add(msg.channelId);
        } else if (r.channelId.isNotEmpty) {
          retainedChannelIds.add(r.channelId);
        }
      }

      if (ticket != _hydrateGeneration || !mounted) {
        return;
      }

      _mentionHeaderByChannelId.removeWhere(
        (String k, MentionHeader _) => !retainedChannelIds.contains(k),
      );
      _guildIdPreviewByChannelId.removeWhere(
        (String k, String _) => !retainedChannelIds.contains(k),
      );

      _skippedMessageIds
        ..clear()
        ..addAll(skipped);

      for (final drift_db.NotificationMentionFeedData r in rows) {
        if (skipped.contains(r.messageId)) {
          continue;
        }
        final Message? msg = _messageById[r.messageId];
        final String channelId = msg != null && msg.channelId.isNotEmpty
            ? msg.channelId
            : r.channelId;
        if (channelId.isEmpty) {
          continue;
        }
        await _ensureHeaderCached(db, channelId, msg, reload: reload);
        if (ticket != _hydrateGeneration || !mounted) {
          return;
        }
      }

      await prefetchMessageStickerAspectRatios(
        _messageById.values.whereType<Message>(),
      );
    } finally {
      if (ticket == _hydrateGeneration && mounted) {
        _feedHydrationPending = false;
        _pinCeiling();
        _markNewestSeen();
        _hydrated?.complete();
        _hydrated = null;
        setState(() {});
      }
    }
  }

  Future<void> _ensureHeaderCached(
    drift_db.FluxerDatabase db,
    String channelId,
    Message? msg, {
    required bool reload,
  }) async {
    if (!reload && _mentionHeaderByChannelId.containsKey(channelId)) {
      return;
    }
    final MentionHeaderResult result = msg != null
        ? await loadMentionHeaderForMessage(db, msg)
        : await loadMentionHeaderForChannelId(db, channelId);
    _mentionHeaderByChannelId[channelId] = result.header;
    _guildIdPreviewByChannelId[channelId] = result.guildIdForPreview;
  }

  void _onScrollNearEnd() {
    if (!_scroll.hasClients) {
      return;
    }
    final double max = _scroll.position.maxScrollExtent;
    if (max <= 0) {
      return;
    }
    if (_scroll.offset < max * _kLoadMoreScrollThreshold) {
      return;
    }
    final MentionFeedUiState sync = ref.read(mentionFeedCoordinatorProvider);
    if (sync.busy || !sync.hasMore) {
      return;
    }
    final List<drift_db.NotificationMentionFeedData>? rows = ref
        .read(notificationMentionFeedStreamProvider)
        .value;
    if (rows == null || rows.isEmpty) {
      return;
    }
    unawaited(
      ref
          .read(mentionFeedCoordinatorProvider.notifier)
          .loadMorePage(beforeMessageId: rows.last.messageId),
    );
  }

  Future<void> _removeMention(String messageId) async {
    setState(() => _removedMessageIds.add(messageId));
    await ref
        .read(notificationsRepositoryProvider)
        .removeMentionLocalAndRemote(messageId);
    if (mounted) {
      _messageById.remove(messageId);
      _skippedMessageIds.remove(messageId);
      setState(() {});
    }
  }

  Future<void> _replyToMessage(BuildContext outerContext, Message msg) async {
    await ref.read(chatViewModelProvider.notifier).prepareReplyInChannel(msg);
    if (!outerContext.mounted) {
      return;
    }
    await _jumpToMessage(outerContext, msg);
  }

  Future<void> _jumpToMessage(BuildContext outerContext, Message msg) async {
    if (_memory.readThisVisit.add(msg.id)) {
      setState(() {});
    }
    final drift_db.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    final drift_db.Channel? chRow = await db.channelDao.getChannelById(
      msg.channelId,
    );
    if (!outerContext.mounted) {
      return;
    }
    if (chRow == null) {
      navigateToContent(
        outerContext,
        RoutePaths.dmChannelMessage(msg.channelId, msg.id),
      );
      return;
    }
    navigateToContent(
      outerContext,
      RoutePaths.guildChannelMessage(chRow.guildId, msg.channelId, msg.id),
    );
  }

  String _channelKey(drift_db.NotificationMentionFeedData row) {
    final Message? msg = _messageById[row.messageId];
    return msg != null && msg.channelId.isNotEmpty
        ? msg.channelId
        : row.channelId;
  }

  bool _isHydrated(drift_db.NotificationMentionFeedData row) {
    return _messageById.containsKey(row.messageId) &&
        (!_feedHydrationPending ||
            _mentionHeaderByChannelId.containsKey(_channelKey(row)));
  }

  Iterable<drift_db.NotificationMentionFeedData> _visibleRows(
    List<drift_db.NotificationMentionFeedData> rows,
  ) => rows.where(
    (drift_db.NotificationMentionFeedData r) =>
        compareSnowflakeIds(r.messageId, _memory.ceilingId ?? r.messageId) <=
            0 &&
        !_skippedMessageIds.contains(r.messageId) &&
        !_removedMessageIds.contains(r.messageId) &&
        _isHydrated(r),
  );

  Widget _buildMentionTile(
    drift_db.NotificationMentionFeedData row, {
    required bool showSectionHeader,
  }) {
    final Message? msg = _messageById[row.messageId];
    final String channelKey = _channelKey(row);
    final bool isNew = _isNew(row.messageId);
    final Widget card = MentionInboxCard(
      messageId: row.messageId,
      message: msg,
      header: _mentionHeaderByChannelId[channelKey],
      previewGuildId: _guildIdPreviewByChannelId[channelKey],
      isUnread: isNew && !_memory.readThisVisit.contains(row.messageId),
      onJump: (Message m) => unawaited(_jumpToMessage(context, m)),
      onReply: isNew
          ? (Message m) => unawaited(_replyToMessage(context, m))
          : null,
      onRemove: (String id) => unawaited(_removeMention(id)),
    );
    return Column(
      key: ValueKey<String>(row.messageId),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (showSectionHeader)
          NotificationSectionHeader(
            label: FluxerLocalizations.of(context).notificationsRecentActivity,
          ),
        card,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final MentionFeedUiState sync = ref.watch(mentionFeedCoordinatorProvider);

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<List<drift_db.NotificationMentionFeedData>> rowsAsync = ref
        .watch(notificationMentionFeedStreamProvider);

    return rowsAsync.when(
      skipLoadingOnReload: true,
      loading: _buildLoading,
      error: (Object err, _) => _buildError(err, l10n),
      data: (List<drift_db.NotificationMentionFeedData> rows) =>
          _buildList(rows, sync, l10n),
    );
  }

  Widget _buildLoading() {
    return FluxerRefreshScrollView(
      controller: _scroll,
      onRefresh: _pullToRefresh,
      slivers: const <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: NotificationsLoadingState(),
        ),
      ],
    );
  }

  Widget _buildError(Object error, FluxerLocalizations l10n) {
    return FluxerRefreshScrollView(
      controller: _scroll,
      onRefresh: _pullToRefresh,
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
                    userFacingErrorMessage(error, l10n.networkErrorMessage),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.colors.statusDanger,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => unawaited(_refresh()),
                    child: Text(l10n.retry),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildList(
    List<drift_db.NotificationMentionFeedData> rows,
    MentionFeedUiState sync,
    FluxerLocalizations l10n,
  ) {
    final List<drift_db.NotificationMentionFeedData> visible = _visibleRows(
      rows,
    ).toList();
    if (!sync.fetched || (visible.isEmpty && sync.busy)) {
      return _buildLoading();
    }
    if (visible.isEmpty && _feedHydrationPending && rows.isNotEmpty) {
      return _buildLoading();
    }
    final int firstSeenIndex = visible.indexWhere(
      (drift_db.NotificationMentionFeedData r) => !_isNew(r.messageId),
    );
    if (visible.isEmpty && sync.lastError != null) {
      return _buildError(sync.lastError!, l10n);
    }
    if (visible.isEmpty) {
      return FluxerRefreshScrollView(
        controller: _scroll,
        onRefresh: _pullToRefresh,
        slivers: const <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: MentionsEmptyState(),
          ),
        ],
      );
    }
    final bool showEndFooter = !sync.hasMore && !sync.busy;
    final bool showLoadBusy = sync.busy && sync.hasMore;
    return FluxerRefreshScrollView(
      controller: _scroll,
      onRefresh: _pullToRefresh,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 12),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext _, int index) {
                if (index < visible.length) {
                  return _buildMentionTile(
                    visible[index],
                    showSectionHeader: index == firstSeenIndex,
                  );
                }
                if (showLoadBusy) {
                  return const NotificationsLoadMoreFooter();
                }
                return const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kNotificationRowHorizontalPadding,
                  ),
                  child: MentionsEndFooter(),
                );
              },
              childCount:
                  visible.length + (showLoadBusy || showEndFooter ? 1 : 0),
              findChildIndexCallback: (Key key) {
                if (key is! ValueKey<String>) {
                  return null;
                }
                final int index = visible.indexWhere(
                  (drift_db.NotificationMentionFeedData r) =>
                      r.messageId == key.value,
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
