import 'dart:async';

import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_member_list_provider.g.dart';

@Riverpod(keepAlive: true)
class ThreadMemberLists extends _$ThreadMemberLists {
  final Map<String, Set<String>> _subscribed = <String, Set<String>>{};

  List<String> subscribe(String guildId, String threadId) =>
      List<String>.of((_subscribed[guildId] ??= <String>{})..add(threadId));

  List<String> unsubscribe(String guildId, String threadId) {
    final Set<String>? ids = _subscribed[guildId];
    if (ids == null) {
      return const <String>[];
    }
    ids.remove(threadId);
    if (ids.isEmpty) {
      _subscribed.remove(guildId);
    }
    return List<String>.of(ids);
  }

  @override
  Map<String, List<ThreadMemberEntry>> build() =>
      const <String, List<ThreadMemberEntry>>{};

  void apply(ThreadMemberListUpdateEvent event) {
    state = <String, List<ThreadMemberEntry>>{
      ...state,
      event.threadId: List<ThreadMemberEntry>.unmodifiable(event.members),
    };
  }

  void remove(String threadId) {
    if (!ref.mounted || !state.containsKey(threadId)) {
      return;
    }
    state = Map<String, List<ThreadMemberEntry>>.of(state)..remove(threadId);
  }

  void clearAll() {
    if (state.isEmpty) {
      return;
    }
    state = const <String, List<ThreadMemberEntry>>{};
  }

  void clearGuild(String guildId) {
    final Set<String>? ids = _subscribed[guildId];
    if (ids == null || !ids.any(state.containsKey)) {
      return;
    }
    state = Map<String, List<ThreadMemberEntry>>.of(state)
      ..removeWhere((String threadId, _) => ids.contains(threadId));
  }
}

@riverpod
List<ThreadMemberEntry>? threadMemberList(Ref ref, String threadId) =>
    ref.watch(
      threadMemberListsProvider.select(
        (Map<String, List<ThreadMemberEntry>> lists) => lists[threadId],
      ),
    );

@riverpod
void threadMemberListSubscription(Ref ref, String guildId, String threadId) {
  final ThreadMemberLists lists = ref.read(threadMemberListsProvider.notifier);
  GatewayConnection? subscribedConnection;

  void send(GatewayConnection connection, List<String> threadIds) {
    connection.sendLazyRequest(
      subscriptions: <String, LazyRequestSubscription>{
        guildId: LazyRequestSubscription(threadMemberLists: threadIds),
      },
    );
  }

  void sync() {
    if (!ref.mounted) {
      return;
    }
    final GatewayConnection connection = ref.read(gatewayConnectionProvider);
    final bool active = ref.read(threadChannelsActiveProvider(guildId));
    if (!active || connection.state != GatewayState.connected) {
      lists.unsubscribe(guildId, threadId);
      subscribedConnection = null;
      return;
    }
    send(connection, lists.subscribe(guildId, threadId));
    subscribedConnection = connection;
  }

  ref
    ..listen<bool>(
      gatewayConnectionProvider.select(
        (GatewayConnection c) => c.state == GatewayState.connected,
      ),
      (_, _) => scheduleMicrotask(sync),
    )
    ..listen<bool>(
      threadChannelsActiveProvider(guildId),
      (_, _) => scheduleMicrotask(sync),
    )
    ..listen<int>(
      gatewayFullRecoveryProvider,
      (_, _) => scheduleMicrotask(sync),
    )
    ..onDispose(() {
      final List<String> remaining = lists.unsubscribe(guildId, threadId);
      final GatewayConnection? connection = subscribedConnection;
      if (connection != null && connection.state == GatewayState.connected) {
        send(connection, remaining);
      }
      scheduleMicrotask(() => lists.remove(threadId));
    });
  scheduleMicrotask(sync);
}
