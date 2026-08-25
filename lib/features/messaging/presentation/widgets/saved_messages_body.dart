import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/saved_messages_empty_state.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/saved_messages_end_footer.dart';
import 'package:fluxer_app/features/messaging/providers/saved_message_list_provider.dart';
import 'package:fluxer_app/features/messaging/providers/saved_messages_sync_provider.dart';
import 'package:fluxer_app/features/notifications/data/mention_header_loader.dart';
import 'package:fluxer_app/features/notifications/domain/mention_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mention_inbox_card.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/refresh/fluxer_refresh_scroll_view.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class SavedMessagesBody extends ConsumerStatefulWidget {
  const SavedMessagesBody({
    super.key,
    this.scrollController,
    this.padding = const EdgeInsets.fromLTRB(12, 8, 12, 12),
  });

  final ScrollController? scrollController;
  final EdgeInsets padding;

  @override
  ConsumerState<SavedMessagesBody> createState() => _SavedMessagesBodyState();
}

class _SavedMessagesBodyState extends ConsumerState<SavedMessagesBody> {
  final Map<String, Message?> _messageById = <String, Message?>{};
  final Map<String, MentionHeader> _headerByChannelId =
      <String, MentionHeader>{};
  final Map<String, String> _guildIdPreviewByChannelId = <String, String>{};
  bool _hydrating = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_bootstrapIfNeeded());
    });
  }

  Future<void> _bootstrapIfNeeded() async {
    final SavedMessagesSyncState sync = ref.read(savedMessagesSyncProvider);
    if (sync.fetched) {
      return;
    }
    await ref.read(savedMessagesSyncProvider.notifier).refresh();
  }

  Future<void> _refresh() async {
    await ref.read(savedMessagesSyncProvider.notifier).refresh();
  }

  Future<void> _hydrate(List<String> messageIds) async {
    if (_hydrating) {
      return;
    }
    _hydrating = true;
    try {
      final drift_db.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
      _messageById.removeWhere(
        (String key, Message? _) => !messageIds.contains(key),
      );
      for (final String messageId in messageIds) {
        if (_messageById.containsKey(messageId)) {
          continue;
        }
        final drift_db.Message? row = await db.messageDao.getMessage(messageId);
        if (!mounted) {
          return;
        }
        final Message? message = row == null ? null : Message.fromRow(row);
        _messageById[messageId] = message;
        if (message != null) {
          await _ensureHeader(db, message);
        }
      }
      if (mounted) {
        setState(() {});
      }
    } finally {
      _hydrating = false;
    }
  }

  Future<void> _ensureHeader(
    drift_db.FluxerDatabase db,
    Message message,
  ) async {
    final String channelId = message.channelId;
    if (_headerByChannelId.containsKey(channelId)) {
      return;
    }
    final MentionHeaderResult result = await loadMentionHeaderForMessage(
      db,
      message,
    );
    _headerByChannelId[channelId] = result.header;
    _guildIdPreviewByChannelId[channelId] = result.guildIdForPreview;
  }

  Future<void> _removeBookmark(String messageId) async {
    await ref.read(savedMessagesRepositoryProvider).unsaveMessage(messageId);
    _messageById.remove(messageId);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _jumpToMessage(Message message) async {
    final drift_db.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    final drift_db.Channel? channel = await db.channelDao.getChannelById(
      message.channelId,
    );
    if (!mounted) {
      return;
    }
    if (channel == null) {
      navigateToContent(
        context,
        RoutePaths.dmChannelMessage(message.channelId, message.id),
      );
      return;
    }
    navigateToContent(
      context,
      RoutePaths.guildChannelMessage(
        channel.guildId,
        message.channelId,
        message.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final SavedMessagesSyncState sync = ref.watch(savedMessagesSyncProvider);
    final AsyncValue<List<String>> idsAsync = ref.watch(
      savedMessageIdsProvider,
    );
    return Padding(
      padding: widget.padding,
      child: idsAsync.when(
        skipLoadingOnReload: false,
        loading: () => _buildLoading(colors),
        error: (Object error, _) => _buildError(error, l10n),
        data: (List<String> messageIds) {
          if (!sync.fetched || sync.busy) {
            return _buildLoading(colors);
          }
          if (sync.lastError != null) {
            return _buildError(sync.lastError!, l10n);
          }
          if (messageIds.isNotEmpty) {
            unawaited(_hydrate(messageIds));
          } else {
            _messageById.clear();
          }
          return _buildList(messageIds, l10n);
        },
      ),
    );
  }

  Widget _bottomInsetSliver(BuildContext context) {
    final double bottom = FluxerBottomSheet.scrollBottomPaddingOf(context);
    if (bottom <= 0) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverPadding(
      padding: EdgeInsets.only(bottom: bottom),
      sliver: const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }

  Widget _buildLoading(FluxerColorTheme colors) {
    return FluxerRefreshScrollView(
      controller: widget.scrollController,
      onRefresh: _refresh,
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: FluxerLoadingSpinner(color: colors.brandPrimary),
          ),
        ),
        _bottomInsetSliver(context),
      ],
    );
  }

  Widget _buildError(Object error, FluxerLocalizations l10n) {
    return FluxerRefreshScrollView(
      controller: widget.scrollController,
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
        _bottomInsetSliver(context),
      ],
    );
  }

  Widget _buildList(List<String> messageIds, FluxerLocalizations l10n) {
    if (messageIds.isEmpty) {
      return FluxerRefreshScrollView(
        controller: widget.scrollController,
        onRefresh: _refresh,
        slivers: <Widget>[
          const SliverFillRemaining(
            hasScrollBody: false,
            child: SavedMessagesEmptyState(),
          ),
          _bottomInsetSliver(context),
        ],
      );
    }
    if (_hydrating && _messageById.isEmpty) {
      return _buildLoading(context.colors);
    }
    return FluxerRefreshScrollView(
      controller: widget.scrollController,
      onRefresh: _refresh,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            final String messageId = messageIds[index];
            final Message? message = _messageById[messageId];
            final String channelId = message?.channelId ?? '';
            return MentionInboxCard(
              messageId: messageId,
              message: message,
              header: channelId.isEmpty ? null : _headerByChannelId[channelId],
              previewGuildId: _guildIdPreviewByChannelId[channelId],
              removeTooltip: l10n.savedMessagesRemoveTooltip,
              onJump: (Message msg) => unawaited(_jumpToMessage(msg)),
              onRemove: (String id) => unawaited(_removeBookmark(id)),
            );
          }, childCount: messageIds.length),
        ),
        const SliverToBoxAdapter(child: SavedMessagesEndFooter()),
        _bottomInsetSliver(context),
      ],
    );
  }
}
