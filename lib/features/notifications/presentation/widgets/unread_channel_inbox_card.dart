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
import 'package:fluxer_app/features/notifications/data/unread_inbox_view.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_removable_row.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_inbox_card_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_inbox_card_preview.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

class UnreadChannelInboxCard extends ConsumerStatefulWidget {
  const UnreadChannelInboxCard({
    required this.row,
    required this.onCollapsedChanged,
    required this.onDismissed,
    super.key,
  });

  final UnreadInboxRow row;
  final ValueChanged<bool> onCollapsedChanged;
  final VoidCallback onDismissed;

  @override
  ConsumerState<UnreadChannelInboxCard> createState() =>
      _UnreadChannelInboxCardState();
}

class _UnreadChannelInboxCardState
    extends ConsumerState<UnreadChannelInboxCard> {
  bool _markingRead = false;
  bool _animateSize = false;

  UnreadInboxEntry get _entry => widget.row.entry;

  Future<void> _toggleCollapsed() async {
    final drift_db.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    final bool nextCollapsed = !widget.row.collapsed;
    final drift_db.Channel? channel = await db.channelDao.getChannelById(
      _entry.channelId,
    );
    if (channel != null && isThreadFeatureChannelType(channel.type)) {
      return;
    }
    _animateSize = true;
    widget.onCollapsedChanged(nextCollapsed);
    await db.notificationDao.upsertUnreadCollapsed(
      channelId: _entry.channelId,
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
      if (marked) {
        widget.onDismissed();
      } else if (mounted) {
        setState(() => _markingRead = false);
      }
    }
  }

  Future<bool> _markReadNow() async {
    final NotificationsRepository repo = ref.read(
      notificationsRepositoryProvider,
    );
    String? messageId = await repo.resolveMarkReadMessageId(_entry.channelId);
    final List<Message> preview = widget.row.data.messages;
    messageId ??= preview.isNotEmpty ? preview.last.id : null;
    if (messageId == null || messageId.isEmpty) {
      return false;
    }
    await repo.markChannelRead(
      channelId: _entry.channelId,
      messageId: messageId,
    );
    return true;
  }

  void _jump({String? explicitMessageId}) {
    final UnreadInboxEntry entry = _entry;
    final String? guildId = entry.guildId;
    final List<Message> preview = widget.row.data.messages;
    final String? resolved =
        explicitMessageId ?? (preview.isNotEmpty ? preview.first.id : null);

    if (entry.isDm) {
      navigateToContent(
        context,
        resolved != null
            ? RoutePaths.dmChannelMessage(entry.channelId, resolved)
            : RoutePaths.dmChannel(entry.channelId),
      );
      return;
    }
    if (guildId == null) {
      return;
    }
    navigateToContent(
      context,
      resolved != null
          ? RoutePaths.guildChannelMessage(guildId, entry.channelId, resolved)
          : RoutePaths.guildChannel(guildId, entry.channelId),
    );
  }

  Future<void> _openGuildNotificationSettings() async {
    final String? guildId = _entry.guildId;
    if (guildId == null) {
      return;
    }
    await context.push(RoutePaths.guildSettingsPath(guildId));
  }

  @override
  Widget build(BuildContext context) {
    final UnreadInboxRow row = widget.row;
    final UnreadInboxCardData data = row.data;
    final UnreadInboxCardMeta meta = data.meta;
    return NotificationRemovableRow(
      removing: _markingRead,
      onRemoved: () => unawaited(_markRead()),
      child: NotificationRowSurface(
        onTap: _jump,
        semanticLabel: meta.channelTitle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ExcludeSemantics(
                  child: UnreadInboxCardLeading(entry: row.entry, meta: meta),
                ),
                const SizedBox(width: kNotificationRowLeadingGap),
                Expanded(
                  child: UnreadInboxCardHeader(
                    entry: row.entry,
                    meta: meta,
                    collapsed: row.collapsed,
                    read: row.read,
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
                ),
              ],
            ),
            AnimatedSize(
              duration: _animateSize ? context.motion.normal : Duration.zero,
              curve: context.motion.curve,
              alignment: Alignment.topCenter,
              child: row.collapsed
                  ? const SizedBox(width: double.infinity)
                  : UnreadInboxCardPreview(
                      preview: data.messages,
                      read: row.read,
                      showViewAllUnread: data.hasMoreUnread,
                      previewRoleGuildId: row.entry.guildId,
                      onViewAllUnread: (Message m) =>
                          _jump(explicitMessageId: m.id),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
