import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/notifications/data/mention_header_loader.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mention_inbox_card.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mentions_empty_state.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mentions_end_footer.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_skeleton.dart';
import 'package:fluxer_app/features/notifications/providers/notification_stream_providers.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/ui/refresh/fluxer_refresh_scroll_view.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kLoadMoreScrollThreshold = 0.8;

const int _kLoadMoreSkeletonRows = 2;
const Duration _kRemoveRowDuration = Duration(milliseconds: 200);

class NotificationsMentionsBody extends ConsumerStatefulWidget {
  const NotificationsMentionsBody({super.key});

  @override
  ConsumerState<NotificationsMentionsBody> createState() =>
      _NotificationsMentionsBodyState();
}

class _NotificationsMentionsBodyState
    extends ConsumerState<NotificationsMentionsBody> {
  final ScrollController _scroll = ScrollController();
  final Map<String, Message?> _messageById = <String, Message?>{};
  final Set<String> _skippedMessageIds = <String>{};
  final Set<String> _removingMessageIds = <String>{};
  final Map<String, MentionHeader> _mentionHeaderByChannelId =
      <String, MentionHeader>{};

  /// Empty string marks a DM snapshot; otherwise the guild id used to resolve
  /// member role colors in the inline preview.
  final Map<String, String> _guildIdPreviewByChannelId = <String, String>{};

  int _hydrateGeneration = 0;
  bool _feedHydrationPending = false;

  @override
  void initState() {
    super.initState();
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
  void dispose() {
    _scroll
      ..removeListener(_onScrollNearEnd)
      ..dispose();
    super.dispose();
  }

  Future<void> _refresh() {
    return ref.read(mentionFeedCoordinatorProvider.notifier).refresh();
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

      if (ticket != _hydrateGeneration || !mounted) {
        return;
      }
    } finally {
      if (ticket == _hydrateGeneration && mounted) {
        _feedHydrationPending = false;
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

  void _startRemovingMention(String messageId) {
    setState(() => _removingMessageIds.add(messageId));
  }

  Future<void> _removeMention(String messageId) async {
    await ref
        .read(notificationsRepositoryProvider)
        .removeMentionLocalAndRemote(messageId);
    if (mounted) {
      _messageById.remove(messageId);
      _skippedMessageIds.remove(messageId);
      _removingMessageIds.remove(messageId);
      setState(() {});
    }
  }

  Future<void> _jumpToMessage(BuildContext outerContext, Message msg) async {
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

  Iterable<drift_db.NotificationMentionFeedData> _visibleRows(
    List<drift_db.NotificationMentionFeedData> rows,
  ) => rows.where(
    (drift_db.NotificationMentionFeedData r) =>
        !_skippedMessageIds.contains(r.messageId),
  );

  Widget _buildMentionTile(drift_db.NotificationMentionFeedData row) {
    final bool hydrated = _messageById.containsKey(row.messageId);
    final Message? msg = _messageById[row.messageId];
    final String channelKey = msg != null && msg.channelId.isNotEmpty
        ? msg.channelId
        : row.channelId;
    return _RemovableRow(
      key: ValueKey<String>(row.messageId),
      removing: _removingMessageIds.contains(row.messageId),
      onRemoved: () => unawaited(_removeMention(row.messageId)),
      child: AnimatedSize(
        duration: context.motion.normal,
        alignment: Alignment.topCenter,
        child: AnimatedSwitcher(
          duration: context.motion.normal,
          child: hydrated
              ? Padding(
                  key: const ValueKey<String>('row'),
                  padding: const EdgeInsets.symmetric(
                    horizontal: kNotificationRowHorizontalPadding,
                  ),
                  child: MentionInboxCard(
                    messageId: row.messageId,
                    message: msg,
                    header: _mentionHeaderByChannelId[channelKey],
                    previewGuildId: _guildIdPreviewByChannelId[channelKey],
                    onJump: (Message m) =>
                        unawaited(_jumpToMessage(context, m)),
                    onRemove: _startRemovingMention,
                  ),
                )
              : const NotificationsSkeletonList(
                  key: ValueKey<String>('skeleton'),
                  rowCount: 1,
                ),
        ),
      ),
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
      onRefresh: _refresh,
      slivers: const <Widget>[
        SliverToBoxAdapter(child: NotificationsSkeletonList()),
      ],
    );
  }

  Widget _buildError(Object error, FluxerLocalizations l10n) {
    return FluxerRefreshScrollView(
      onRefresh: _refresh,
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
    if (visible.isEmpty && !sync.fetched) {
      return _buildLoading();
    }
    if (visible.isEmpty && _feedHydrationPending && rows.isNotEmpty) {
      return _buildLoading();
    }
    if (visible.isEmpty && sync.lastError != null) {
      return _buildError(sync.lastError!, l10n);
    }
    if (visible.isEmpty) {
      return FluxerRefreshScrollView(
        onRefresh: _refresh,
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
      onRefresh: _refresh,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 12),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext _, int index) {
                if (index < visible.length) {
                  return _buildMentionTile(visible[index]);
                }
                if (showLoadBusy) {
                  return const NotificationsSkeletonList(
                    rowCount: _kLoadMoreSkeletonRows,
                  );
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
            ),
          ),
        ),
      ],
    );
  }
}

class _RemovableRow extends StatefulWidget {
  const _RemovableRow({
    required this.removing,
    required this.onRemoved,
    required this.child,
    super.key,
  });

  final bool removing;
  final VoidCallback onRemoved;
  final Widget child;

  @override
  State<_RemovableRow> createState() => _RemovableRowState();
}

class _RemovableRowState extends State<_RemovableRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _kRemoveRowDuration,
    value: 1,
  )..addStatusListener(_onStatus);
  late final Animation<double> _curve = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );

  @override
  void didUpdateWidget(_RemovableRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.removing && !oldWidget.removing) {
      _controller.reverse();
    }
  }

  void _onStatus(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      widget.onRemoved();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _curve,
      alignment: Alignment.topCenter,
      child: FadeTransition(opacity: _curve, child: widget.child),
    );
  }
}
