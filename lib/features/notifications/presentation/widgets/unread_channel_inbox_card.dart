import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadFeatureChannelType;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/notifications/data/notifications_repository.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_cache.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_meta.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_removable_row.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_skeleton.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_inbox_card_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_inbox_card_preview.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

class UnreadChannelInboxCard extends ConsumerStatefulWidget {
  const UnreadChannelInboxCard({
    required this.entry,
    required this.refreshEpoch,
    super.key,
  });

  final UnreadInboxEntry entry;
  final int refreshEpoch;

  @override
  ConsumerState<UnreadChannelInboxCard> createState() =>
      _UnreadChannelInboxCardState();
}

class _UnreadChannelInboxCardState
    extends ConsumerState<UnreadChannelInboxCard> {
  UnreadInboxCardData? _data;
  bool _loadFailed = false;
  bool _markingRead = false;
  bool _animateSize = false;
  int _loadGeneration = 0;

  @override
  void initState() {
    super.initState();
    final UnreadInboxCardCache cache = ref.read(unreadInboxCardCacheProvider);
    _data = cache.latest(widget.entry.channelId);
    if (!cache.isFresh(widget.entry)) {
      unawaited(_load());
    }
  }

  @override
  void didUpdateWidget(UnreadChannelInboxCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.entry.ackMessageId != widget.entry.ackMessageId ||
        oldWidget.refreshEpoch != widget.refreshEpoch) {
      unawaited(_load());
    }
  }

  Future<void> _load() async {
    final int generation = ++_loadGeneration;
    try {
      final UnreadInboxCardData data = await ref
          .read(unreadInboxCardCacheProvider)
          .load(widget.entry);
      if (!mounted || generation != _loadGeneration) {
        return;
      }
      setState(() {
        _data = data;
        _loadFailed = false;
      });
    } on Object catch (_) {
      if (!mounted || generation != _loadGeneration) {
        return;
      }
      setState(() => _loadFailed = true);
    }
  }

  Future<void> _toggleCollapsed() async {
    final drift_db.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    final bool nextCollapsed = !widget.entry.isCollapsed;
    _animateSize = true;
    final drift_db.Channel? channel = await db.channelDao.getChannelById(
      widget.entry.channelId,
    );
    if (channel != null && isThreadFeatureChannelType(channel.type)) {
      return;
    }
    await db.notificationDao.upsertUnreadCollapsed(
      channelId: widget.entry.channelId,
      isCollapsed: nextCollapsed,
    );
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.unreadChannels);
  }

  Future<void> _markRead() async {
    bool marked = false;
    try {
      marked = await _markReadNow();
    } finally {
      if (!marked && mounted) {
        setState(() => _markingRead = false);
      }
    }
  }

  Future<bool> _markReadNow() async {
    final NotificationsRepository repo = ref.read(
      notificationsRepositoryProvider,
    );
    String? messageId = await repo.resolveMarkReadMessageId(
      widget.entry.channelId,
    );
    final List<Message> preview = _data?.messages ?? const <Message>[];
    messageId ??= preview.isNotEmpty ? preview.last.id : null;
    if (messageId == null || messageId.isEmpty) {
      return false;
    }
    await repo.markChannelRead(
      channelId: widget.entry.channelId,
      messageId: messageId,
    );
    return true;
  }

  void _jump({String? explicitMessageId}) {
    final String? guildId = widget.entry.guildId;
    final List<Message> preview = _data?.messages ?? const <Message>[];
    final String? resolved =
        explicitMessageId ?? (preview.isNotEmpty ? preview.first.id : null);

    if (widget.entry.isDm) {
      navigateToContent(
        context,
        resolved != null
            ? RoutePaths.dmChannelMessage(widget.entry.channelId, resolved)
            : RoutePaths.dmChannel(widget.entry.channelId),
      );
      return;
    }
    if (guildId == null) {
      return;
    }
    navigateToContent(
      context,
      resolved != null
          ? RoutePaths.guildChannelMessage(
              guildId,
              widget.entry.channelId,
              resolved,
            )
          : RoutePaths.guildChannel(guildId, widget.entry.channelId),
    );
  }

  Future<void> _openGuildNotificationSettings() async {
    final String? guildId = widget.entry.guildId;
    if (guildId == null) {
      return;
    }
    await context.push(RoutePaths.guildSettingsPath(guildId));
  }

  @override
  Widget build(BuildContext context) {
    final UnreadInboxCardData? data = _data;
    if (data != null && data.messages.isEmpty) {
      return const SizedBox.shrink();
    }
    final bool collapsed = widget.entry.isCollapsed;
    final UnreadInboxCardMeta? meta = data?.meta;
    return NotificationRemovableRow(
      removing: _markingRead,
      onRemoved: () => unawaited(_markRead()),
      child: NotificationRowSurface(
        onTap: _jump,
        semanticLabel: meta?.channelTitle,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (meta == null)
              const NotificationsSkeletonBlock(
                width: kNotificationRowLeadingSize,
                height: kNotificationRowLeadingSize,
              )
            else
              ExcludeSemantics(
                child: UnreadInboxCardLeading(entry: widget.entry, meta: meta),
              ),
            const SizedBox(width: kNotificationRowLeadingGap),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (meta == null)
                    const NotificationsSkeletonBlock(
                      height: kNotificationRowLeadingSize,
                    )
                  else
                    UnreadInboxCardHeader(
                      entry: widget.entry,
                      meta: meta,
                      collapsed: collapsed,
                      onToggleCollapsed:
                          isThreadFeatureChannelType(
                            meta.guildChannelVisualType.wireValue,
                          )
                          ? null
                          : () => unawaited(_toggleCollapsed()),
                      onMarkRead: () => setState(() => _markingRead = true),
                      onOpenGuildNotificationSettings: () =>
                          unawaited(_openGuildNotificationSettings()),
                    ),
                  AnimatedSize(
                    duration: _animateSize
                        ? context.motion.normal
                        : Duration.zero,
                    curve: context.motion.curve,
                    alignment: Alignment.topCenter,
                    child: collapsed
                        ? const SizedBox(width: double.infinity)
                        : UnreadInboxCardPreview(
                            preview: data?.messages,
                            isLoading: data == null && !_loadFailed,
                            showViewAllUnread: data?.hasMoreUnread ?? false,
                            previewRoleGuildId: widget.entry.guildId,
                            onViewAllUnread: (Message m) =>
                                _jump(explicitMessageId: m.id),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
