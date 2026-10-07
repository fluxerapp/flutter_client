import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_unavailable_screen.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class ThreadRouteGate extends ConsumerStatefulWidget {
  const ThreadRouteGate({
    required this.guildId,
    required this.channelId,
    required this.child,
    super.key,
  });

  final String guildId;
  final String channelId;
  final Widget child;

  @override
  ConsumerState<ThreadRouteGate> createState() => _ThreadRouteGateState();
}

class _ThreadRouteGateState extends ConsumerState<ThreadRouteGate> {
  String? _fetchKey;
  String? _settledKey;
  String? _redirectKey;
  ({String key, String? parentId})? _seenThread;

  String get _key => '${widget.guildId}:${widget.channelId}';

  Widget _loading() => MobileChatBackScope(
    child: GuildRouteLoadingShell(channelIdForBackUnread: widget.channelId),
  );

  void _fetch() {
    final String key = _key;
    if (_fetchKey == key) {
      return;
    }
    _fetchKey = key;
    unawaited(
      ref
          .read(threadsRepositoryProvider)
          .fetch(guildId: widget.guildId, threadId: widget.channelId)
          .then<void>((_) {}, onError: (Object _) {})
          .whenComplete(() {
            if (mounted && _key == key) {
              setState(() => _settledKey = key);
            }
          }),
    );
  }

  void _redirect(String? parentId) {
    final String key = _key;
    if (_redirectKey == key) {
      return;
    }
    _redirectKey = key;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _key != key) {
        return;
      }
      navigateToContent(
        context,
        parentId == null
            ? RoutePaths.guild(widget.guildId)
            : RoutePaths.guildChannel(widget.guildId, parentId),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool active = ref.watch(threadChannelsActiveProvider(widget.guildId));
    final AsyncValue<Channel?> channelAsync = ref.watch(
      channelByIdProvider(widget.channelId),
    );
    final Channel? channel = channelAsync.value;
    if (channel != null && (channel.isThread || channel.isThreadOnly)) {
      final String? threadParentId = channel.isThread ? channel.parentId : null;
      final Channel? parent = threadParentId == null
          ? null
          : ref.watch(channelByIdProvider(threadParentId)).value;
      final String? parentId = parent != null && parent.isThreadOnly
          ? null
          : threadParentId;
      _seenThread = (key: _key, parentId: parentId);
      if (active) {
        _redirectKey = null;
        return widget.child;
      }
      if (!ref.watch(gatewayReadyProvider) ||
          ref.watch(
            guildAvailabilityProvider.select(
              (Set<String> ids) => ids.contains(widget.guildId),
            ),
          )) {
        return _loading();
      }
      _redirect(parentId);
      return _loading();
    }
    final ({String key, String? parentId})? seen = _seenThread;
    if (channel == null && channelAsync.hasValue && seen?.key == _key) {
      _redirect(seen?.parentId);
      return _loading();
    }
    if (active &&
        channel == null &&
        channelAsync.hasValue &&
        _settledKey != _key) {
      _fetch();
      return _loading();
    }
    return widget.child;
  }
}
