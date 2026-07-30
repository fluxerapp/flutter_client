import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/notifications/data/mention_header_loader.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mention_filters_sheet.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mention_inbox_card.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mentions_empty_state.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mentions_end_footer.dart';
import 'package:fluxer_app/features/notifications/providers/notification_stream_providers.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/ui/refresh/fluxer_refresh_scroll_view.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const double _kLoadMoreScrollThreshold = 0.8;

typedef NotificationsMentionsOpenFilterInvoker = Future<void> Function();

class NotificationsMentionsBody extends ConsumerStatefulWidget {
  const NotificationsMentionsBody({
    required this.onOpenFilterInvokerChanged,
    super.key,
  });

  final ValueChanged<NotificationsMentionsOpenFilterInvoker?>
  onOpenFilterInvokerChanged;

  @override
  ConsumerState<NotificationsMentionsBody> createState() =>
      _NotificationsMentionsBodyState();
}

class _NotificationsMentionsBodyState
    extends ConsumerState<NotificationsMentionsBody> {
  final ScrollController _scroll = ScrollController();
  final Map<String, Message?> _messageById = <String, Message?>{};
  final Set<String> _skippedMessageIds = <String>{};
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
    ref.listenManual<AsyncValue<List<drift_db.NotificationMentionFeedData>>>(
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
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onOpenFilterInvokerChanged(_openMentionFilters);
      unawaited(_bootstrapFromPrefsIfUnfetched());
    });
  }

  @override
  void dispose() {
    widget.onOpenFilterInvokerChanged(null);
    _scroll
      ..removeListener(_onScrollNearEnd)
      ..dispose();
    super.dispose();
  }

  Future<void> _openMentionFilters() async {
    final bool applied = await showMentionFiltersSheet(context, ref);
    if (!applied || !mounted) {
      return;
    }
    _resetCachesLocal();
    setState(() {});
  }

  Future<drift_db.NotificationMentionPref?> _readPrefs() {
    return ref.read(fluxerDatabaseProvider).notificationDao.getMentionPrefs();
  }

  Future<void> _bootstrapFromPrefsIfUnfetched() async {
    final MentionFeedUiState sync = ref.read(mentionFeedCoordinatorProvider);
    if (sync.fetched) {
      return;
    }
    await _bootstrapFromPrefs();
  }

  Future<void> _bootstrapFromPrefs() async {
    final drift_db.NotificationMentionPref? prefs = await _readPrefs();
    await ref
        .read(mentionFeedCoordinatorProvider.notifier)
        .refreshWithFilters(
          includeEveryone: prefs?.includeEveryone ?? true,
          includeRoles: prefs?.includeRoles ?? true,
          includeGuilds: prefs?.includeGuilds ?? true,
        );
    if (mounted) {
      _resetCachesLocal();
      setState(() {});
    }
  }

  Future<void> _retryCoordinatorFetch() async {
    final drift_db.NotificationMentionPref? prefs = await _readPrefs();
    await ref
        .read(mentionFeedCoordinatorProvider.notifier)
        .refreshWithFilters(
          includeEveryone: prefs?.includeEveryone ?? true,
          includeRoles: prefs?.includeRoles ?? true,
          includeGuilds: prefs?.includeGuilds ?? true,
        );
  }

  void _resetCachesLocal() {
    _messageById.clear();
    _skippedMessageIds.clear();
    _mentionHeaderByChannelId.clear();
    _guildIdPreviewByChannelId.clear();
  }

  Future<void> _reconcile(
    List<drift_db.NotificationMentionFeedData> rows,
  ) async {
    final int ticket = ++_hydrateGeneration;
    final bool shouldHydrate = rows.isNotEmpty;
    if (shouldHydrate != _feedHydrationPending) {
      _feedHydrationPending = shouldHydrate;
      if (mounted) {
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
      _skippedMessageIds.clear();
      final Set<String> retainedChannelIds = <String>{};

      for (final drift_db.NotificationMentionFeedData r in rows) {
        if (!_messageById.containsKey(r.messageId)) {
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
          _skippedMessageIds.add(r.messageId);
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

      for (final drift_db.NotificationMentionFeedData r in rows) {
        if (_skippedMessageIds.contains(r.messageId)) {
          continue;
        }
        final Message? msg = _messageById[r.messageId];
        final String channelId = msg != null && msg.channelId.isNotEmpty
            ? msg.channelId
            : r.channelId;
        if (channelId.isEmpty) {
          continue;
        }
        await _ensureHeaderCached(db, channelId, msg);
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
    Message? msg,
  ) async {
    if (_mentionHeaderByChannelId.containsKey(channelId)) {
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
    unawaited(_loadMoreWithPrefs(rows.last.messageId));
  }

  Future<void> _loadMoreWithPrefs(String beforeMessageId) async {
    final drift_db.NotificationMentionPref? prefs = await _readPrefs();
    await ref
        .read(mentionFeedCoordinatorProvider.notifier)
        .loadMorePage(
          includeEveryone: prefs?.includeEveryone ?? true,
          includeRoles: prefs?.includeRoles ?? true,
          includeGuilds: prefs?.includeGuilds ?? true,
          beforeMessageId: beforeMessageId,
        );
  }

  Future<void> _removeMention(String messageId) async {
    await ref
        .read(notificationsRepositoryProvider)
        .removeMentionLocalAndRemote(messageId);
    if (mounted) {
      _messageById.remove(messageId);
      _skippedMessageIds.remove(messageId);
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
    final Message? msg = _messageById[row.messageId];
    final String channelKey = msg != null && msg.channelId.isNotEmpty
        ? msg.channelId
        : row.channelId;
    return MentionInboxCard(
      messageId: row.messageId,
      message: msg,
      header: _mentionHeaderByChannelId[channelKey],
      previewGuildId: _guildIdPreviewByChannelId[channelKey],
      onJump: (Message m) => unawaited(_jumpToMessage(context, m)),
      onRemove: (String id) => unawaited(_removeMention(id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MentionFeedUiState sync = ref.watch(mentionFeedCoordinatorProvider);

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final FluxerColorTheme colors = context.colors;
    final AsyncValue<List<drift_db.NotificationMentionFeedData>> rowsAsync = ref
        .watch(notificationMentionFeedStreamProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: rowsAsync.when(
        skipLoadingOnReload: false,
        loading: () => _buildLoading(colors),
        error: (Object err, _) => _buildError('$err', l10n),
        data: (List<drift_db.NotificationMentionFeedData> rows) =>
            _buildList(rows, sync, l10n, colors),
      ),
    );
  }

  Widget _buildLoading(FluxerColorTheme colors) {
    return FluxerRefreshScrollView(
      onRefresh: _bootstrapFromPrefs,
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: FluxerLoadingSpinner(color: colors.brandPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildError(String message, FluxerLocalizations l10n) {
    return FluxerRefreshScrollView(
      onRefresh: _bootstrapFromPrefs,
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
                    message,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.colors.statusDanger,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => unawaited(_bootstrapFromPrefs()),
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

  Widget _buildCoordinatorError(String message, FluxerLocalizations l10n) {
    return FluxerRefreshScrollView(
      onRefresh: _bootstrapFromPrefs,
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
                    message,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.colors.statusDanger,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => unawaited(_retryCoordinatorFetch()),
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
    FluxerColorTheme colors,
  ) {
    final List<drift_db.NotificationMentionFeedData> visible = _visibleRows(
      rows,
    ).toList();
    if (sync.busy && visible.isEmpty) {
      return _buildLoading(colors);
    }
    if (_feedHydrationPending && rows.isNotEmpty) {
      return _buildLoading(colors);
    }
    if (sync.fetched &&
        sync.lastError != null &&
        visible.isEmpty &&
        !sync.busy) {
      return _buildCoordinatorError('${sync.lastError}', l10n);
    }
    if (sync.fetched &&
        visible.isEmpty &&
        !sync.busy &&
        sync.lastError == null) {
      return FluxerRefreshScrollView(
        onRefresh: _bootstrapFromPrefs,
        slivers: const <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: MentionsEmptyState(),
          ),
        ],
      );
    }
    final bool showEndFooter =
        sync.fetched && !sync.hasMore && visible.isNotEmpty && !sync.busy;
    final bool showLoadBusy = sync.busy && sync.hasMore && visible.isNotEmpty;
    return FluxerRefreshScrollView(
      controller: _scroll,
      onRefresh: _bootstrapFromPrefs,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext _, int index) {
              if (index < visible.length) {
                return _buildMentionTile(visible[index]);
              }
              int rest = index - visible.length;
              if (showLoadBusy) {
                if (rest == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 24,
                    ),
                    child: Center(
                      child: FluxerLoadingSpinner(color: colors.brandPrimary),
                    ),
                  );
                }
                rest--;
              }
              if (showEndFooter && rest == 0) {
                return const MentionsEndFooter();
              }
              return const SizedBox.shrink();
            },
            childCount:
                visible.length +
                (showLoadBusy ? 1 : 0) +
                (showEndFooter ? 1 : 0),
          ),
        ),
      ],
    );
  }
}
