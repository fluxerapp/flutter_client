import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/members/domain/member_list_range_utils.dart';
import 'package:fluxer_app/features/members/providers/member_list_desired_ranges_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_list_subscription_provider.g.dart';

@Riverpod(keepAlive: true)
class MemberListPanelActive extends _$MemberListPanelActive {
  @override
  bool build() => false;

  void setActive({required bool value}) {
    state = value;
  }
}

void _scheduleMemberListSync(Ref ref, void Function() sync) {
  scheduleMicrotask(() {
    if (!ref.mounted) {
      return;
    }
    sync();
  });
}

@Riverpod(keepAlive: true)
void memberListSubscription(Ref ref) {
  String? subscribedGuildId;
  String? subscribedChannelId;
  List<MemberListRange> lastSentRanges = <MemberListRange>[];

  void unsubscribe() {
    final GatewayConnection connection = ref.read(gatewayConnectionProvider);
    if (connection.state != GatewayState.connected) {
      subscribedGuildId = null;
      subscribedChannelId = null;
      lastSentRanges = <MemberListRange>[];
      return;
    }
    if (subscribedGuildId == null || subscribedChannelId == null) {
      return;
    }
    connection.sendLazyRequest(
      subscriptions: <String, LazyRequestSubscription>{
        subscribedGuildId!: LazyRequestSubscription(
          active: true,
          sync: true,
          memberListChannels: <String, List<List<int>>>{
            subscribedChannelId!: <List<int>>[],
          },
        ),
      },
    );
    subscribedGuildId = null;
    subscribedChannelId = null;
    lastSentRanges = <MemberListRange>[];
  }

  void syncSubscription() {
    final GatewayConnection connection = ref.read(gatewayConnectionProvider);
    if (connection.state != GatewayState.connected) {
      return;
    }
    final bool isMemberListVisible = ref.read(
      channelListViewModelProvider.select(
        (ChannelListState s) => s.isMemberListVisible,
      ),
    );
    final bool isPanelActive = ref.read(memberListPanelActiveProvider);
    final String? guildId = ref.read(activeGuildIdProvider);
    final String? channelId = ref.read(activeChannelIdProvider);
    if (!isMemberListVisible ||
        !isPanelActive ||
        guildId == null ||
        channelId == null) {
      unsubscribe();
      return;
    }
    final Channel? channel = ref.read(channelByIdProvider(channelId)).value;
    if (channel == null ||
        channel.guildId != guildId ||
        channel.type == ChannelType.voice) {
      unsubscribe();
      return;
    }
    final String rangesKey = memberListDesiredRangesKey(guildId, channelId);
    final List<MemberListRange> desiredRanges =
        ref.read(memberListDesiredRangesProvider)[rangesKey] ??
        kMemberListInitialSubscriptionRanges;
    final List<MemberListRange> normalized = normalizeMemberListRanges(
      desiredRanges,
    );
    if (subscribedGuildId == guildId &&
        subscribedChannelId == channelId &&
        areMemberListRangesEqual(lastSentRanges, normalized)) {
      ref
          .read(memberListViewportProvider.notifier)
          .setSubscribedRanges(
            guildId: guildId,
            channelId: channelId,
            ranges: normalized,
          );
      return;
    }
    if (subscribedGuildId != guildId || subscribedChannelId != channelId) {
      unsubscribe();
    }
    ref.read(guildSyncProvider.notifier).syncIfNeeded(guildId);
    ref
        .read(memberListViewportProvider.notifier)
        .setSubscribedRanges(
          guildId: guildId,
          channelId: channelId,
          ranges: normalized,
        );
    final Map<String, List<List<int>>> memberListChannels =
        <String, List<List<int>>>{
          channelId: normalized
              .map((MemberListRange range) => <int>[range[0], range[1]])
              .toList(),
        };
    connection.sendLazyRequest(
      subscriptions: <String, LazyRequestSubscription>{
        guildId: LazyRequestSubscription(
          active: true,
          sync: true,
          memberListChannels: memberListChannels,
        ),
      },
    );
    subscribedGuildId = guildId;
    subscribedChannelId = channelId;
    lastSentRanges = normalized;
    unawaited(
      ref.read(guildSyncProvider.notifier).backfillMembersIfSparse(guildId),
    );
  }

  ref
    ..listen<bool>(
      memberListPanelActiveProvider,
      (_, _) => _scheduleMemberListSync(ref, syncSubscription),
    )
    ..listen<Map<String, List<MemberListRange>>>(
      memberListDesiredRangesProvider,
      (_, _) => _scheduleMemberListSync(ref, syncSubscription),
    )
    ..listen<String?>(
      activeGuildIdProvider,
      (_, _) => _scheduleMemberListSync(ref, syncSubscription),
    )
    ..listen<String?>(
      activeChannelIdProvider,
      (_, _) => _scheduleMemberListSync(ref, syncSubscription),
    )
    ..listen<bool>(
      channelListViewModelProvider.select(
        (ChannelListState s) => s.isMemberListVisible,
      ),
      (_, _) => _scheduleMemberListSync(ref, syncSubscription),
    )
    ..listen<GatewayState>(
      gatewayConnectionProvider.select((GatewayConnection c) => c.state),
      (_, _) => _scheduleMemberListSync(ref, syncSubscription),
    )
    ..onDispose(unsubscribe);
  _scheduleMemberListSync(ref, syncSubscription);
}

@Riverpod(keepAlive: true)
void memberListDetailsSubscription(
  Ref ref,
  String guildId,
  String channelId,
  // ignore: avoid_positional_boolean_parameters, Riverpod generated provider keeps existing call sites positional.
  bool enabled,
) {
  String? subscribedGuildId;
  String? subscribedChannelId;
  List<MemberListRange> lastSentRanges = <MemberListRange>[];

  void unsubscribe() {
    final GatewayConnection connection = ref.read(gatewayConnectionProvider);
    if (connection.state != GatewayState.connected) {
      subscribedGuildId = null;
      subscribedChannelId = null;
      lastSentRanges = <MemberListRange>[];
      return;
    }
    if (subscribedGuildId == null || subscribedChannelId == null) {
      return;
    }
    connection.sendLazyRequest(
      subscriptions: <String, LazyRequestSubscription>{
        subscribedGuildId!: LazyRequestSubscription(
          active: true,
          sync: true,
          memberListChannels: <String, List<List<int>>>{
            subscribedChannelId!: <List<int>>[],
          },
        ),
      },
    );
    subscribedGuildId = null;
    subscribedChannelId = null;
    lastSentRanges = <MemberListRange>[];
  }

  void syncSubscription() {
    if (!enabled) {
      unsubscribe();
      return;
    }
    final GatewayConnection connection = ref.read(gatewayConnectionProvider);
    if (connection.state != GatewayState.connected) {
      return;
    }
    final String rangesKey = memberListDesiredRangesKey(guildId, channelId);
    final List<MemberListRange> desiredRanges =
        ref.read(memberListDesiredRangesProvider)[rangesKey] ??
        kMemberListInitialSubscriptionRanges;
    final List<MemberListRange> normalized = normalizeMemberListRanges(
      desiredRanges,
    );
    if (subscribedGuildId == guildId &&
        subscribedChannelId == channelId &&
        areMemberListRangesEqual(lastSentRanges, normalized)) {
      ref
          .read(memberListViewportProvider.notifier)
          .setSubscribedRanges(
            guildId: guildId,
            channelId: channelId,
            ranges: normalized,
          );
      return;
    }
    if (subscribedGuildId != guildId || subscribedChannelId != channelId) {
      unsubscribe();
    }
    ref.read(guildSyncProvider.notifier).syncIfNeeded(guildId);
    ref
        .read(memberListViewportProvider.notifier)
        .setSubscribedRanges(
          guildId: guildId,
          channelId: channelId,
          ranges: normalized,
        );
    connection.sendLazyRequest(
      subscriptions: <String, LazyRequestSubscription>{
        guildId: LazyRequestSubscription(
          active: true,
          sync: true,
          memberListChannels: <String, List<List<int>>>{
            channelId: normalized
                .map((MemberListRange range) => <int>[range[0], range[1]])
                .toList(),
          },
        ),
      },
    );
    subscribedGuildId = guildId;
    subscribedChannelId = channelId;
    lastSentRanges = normalized;
    unawaited(
      ref.read(guildSyncProvider.notifier).backfillMembersIfSparse(guildId),
    );
  }

  ref
    ..listen<Map<String, List<MemberListRange>>>(
      memberListDesiredRangesProvider,
      (_, _) => _scheduleMemberListSync(ref, syncSubscription),
    )
    ..listen<bool>(
      gatewayConnectionProvider.select(
        (GatewayConnection c) => c.state == GatewayState.connected,
      ),
      (_, _) => _scheduleMemberListSync(ref, syncSubscription),
    )
    ..onDispose(unsubscribe);
  _scheduleMemberListSync(ref, syncSubscription);
}
