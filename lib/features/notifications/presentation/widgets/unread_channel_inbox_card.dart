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
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_meta.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_removable_row.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_skeleton.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_inbox_card_header.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/unread_inbox_card_preview.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

class UnreadChannelInboxCard extends ConsumerStatefulWidget {
  const UnreadChannelInboxCard({required this.entry, super.key});

  final UnreadInboxEntry entry;

  @override
  ConsumerState<UnreadChannelInboxCard> createState() =>
      _UnreadChannelInboxCardState();
}

class _UnreadChannelInboxCardState
    extends ConsumerState<UnreadChannelInboxCard> {
  UnreadInboxCardMeta _meta = UnreadInboxCardMeta.empty();
  List<Message>? _preview;
  bool _loadingPreview = false;
  bool _metaLoaded = false;
  bool _markingRead = false;
  int _previewGeneration = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(_loadMeta()));
  }

  @override
  void didUpdateWidget(UnreadChannelInboxCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.entry.recencyComparator != widget.entry.recencyComparator ||
        oldWidget.entry.mentionCount != widget.entry.mentionCount) {
      _markingRead = false;
      unawaited(_loadPreview(force: true));
      return;
    }
    if (oldWidget.entry.isCollapsed != widget.entry.isCollapsed) {
      if (widget.entry.isCollapsed) {
        setState(() => _loadingPreview = false);
      } else if (_preview == null) {
        unawaited(_loadPreview());
      }
    }
  }

  Future<void> _loadMeta() async {
    final drift_db.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    final UnreadInboxCardMeta meta = await loadUnreadInboxCardMeta(
      db,
      widget.entry,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _meta = meta;
      _metaLoaded = true;
    });
    await _loadPreview();
  }

  Future<void> _loadPreview({bool force = false}) async {
    if (widget.entry.isCollapsed) {
      return;
    }
    if (_loadingPreview && !force) {
      return;
    }

    final int generation = ++_previewGeneration;
    final bool showLoading = _preview == null;
    if (showLoading) {
      setState(() => _loadingPreview = true);
    }

    try {
      final NotificationsRepository repo = ref.read(
        notificationsRepositoryProvider,
      );
      final drift_db.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
      drift_db.Channel? driftCh;
      if (!widget.entry.isDm) {
        driftCh = await db.channelDao.getChannelById(widget.entry.channelId);
      }
      final List<Message> list = await repo.loadPreviewForEntry(
        entry: widget.entry,
        guildChannelRow: driftCh,
      );
      if (!mounted || generation != _previewGeneration) {
        return;
      }
      setState(() {
        _preview = list;
        _loadingPreview = false;
      });
    } on Object catch (_) {
      if (!mounted || generation != _previewGeneration) {
        return;
      }
      setState(() => _loadingPreview = false);
    }
  }

  Future<void> _toggleCollapsed() async {
    final drift_db.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    final bool nextCollapsed = !widget.entry.isCollapsed;
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
    if (nextCollapsed || !mounted) {
      return;
    }
    setState(() {
      _preview = null;
      _previewGeneration++;
    });
    await _loadPreview();
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
    messageId ??= (_preview?.isNotEmpty ?? false) ? _preview!.last.id : null;
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
    final List<Message>? preview = _preview;
    final String? resolved =
        explicitMessageId ??
        (preview != null && preview.isNotEmpty ? preview.first.id : null);

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
    final bool collapsed = widget.entry.isCollapsed;
    return NotificationRemovableRow(
      removing: _markingRead,
      onRemoved: () => unawaited(_markRead()),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kNotificationRowHorizontalPadding,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UnreadInboxCardHeader(
              entry: widget.entry,
              meta: _meta,
              collapsed: collapsed,
              onToggleCollapsed:
                  isThreadFeatureChannelType(
                    _meta.guildChannelVisualType.wireValue,
                  )
                  ? null
                  : () => unawaited(_toggleCollapsed()),
              onJump: _jump,
              onMarkRead: () => setState(() => _markingRead = true),
              onOpenGuildNotificationSettings: () =>
                  unawaited(_openGuildNotificationSettings()),
            ),
            AnimatedSize(
              duration: context.motion.normal,
              curve: context.motion.curve,
              alignment: Alignment.topCenter,
              child: collapsed
                  ? const SizedBox(width: double.infinity)
                  : UnreadInboxCardPreview(
                      preview: _preview,
                      isLoading: _loadingPreview || !_metaLoaded,
                      previewRoleGuildId: widget.entry.guildId,
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
