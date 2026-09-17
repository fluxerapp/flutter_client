import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/assistant/assistant_bridge.dart';
import 'package:fluxer_app/core/assistant/assistant_command_dispatcher.dart';
import 'package:fluxer_app/core/assistant/assistant_entities.dart';
import 'package:fluxer_app/core/assistant/assistant_entity_index.dart';
import 'package:fluxer_app/core/assistant/assistant_platform.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';

const Duration _kDonateDebounce = Duration(milliseconds: 800);

final Provider<AssistantBinding> assistantBindingProvider =
    Provider<AssistantBinding>((Ref ref) {
      final AssistantBinding binding = AssistantBinding(ref)..start();
      ref.onDispose(binding.dispose);
      return binding;
    });

class AssistantBinding {
  AssistantBinding(this._ref);

  final Ref _ref;
  AssistantBridge? _bridge;
  Timer? _donateTimer;
  bool _started = false;

  void start() {
    if (_started || !isAssistantChannelSupported()) {
      return;
    }
    _started = true;
    _bridge = AssistantBridge(dispatcher: AssistantCommandDispatcher(_ref))
      ..attach();
    _ref
      ..listen(friendsListProvider, (_, _) => _scheduleDonate())
      ..listen(guildListViewModelProvider, (_, _) => _scheduleDonate())
      ..listen(
        allChannelsProvider.select(
          (AsyncValue<List<Channel>> next) =>
              _assistantChannelDonationToken(next.value ?? const <Channel>[]),
        ),
        (_, _) => _scheduleDonate(),
      )
      ..listen<bool>(gatewayReadyProvider, (bool? previous, bool next) {
        if (next) {
          unawaited(_flushPending());
          _scheduleDonate();
        }
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (next && previous == false) {
          unawaited(_flushPending());
        }
      })
      ..listen<String?>(currentUserIdProvider, (
        String? previous,
        String? next,
      ) {
        if (next == null || next.isEmpty) {
          unawaited(_clear());
          return;
        }
        if (previous != next) {
          _scheduleDonate();
          unawaited(_flushPending());
        }
      })
      ..listen<bool>(
        accountManagerProvider.select(
          (AccountManagerState state) => state.isSwitching,
        ),
        (bool? previous, bool next) {
          if ((previous ?? false) && !next) {
            _scheduleDonate();
          }
        },
      );
    _scheduleDonate();
    if (_ref.read(gatewayReadyProvider)) {
      unawaited(_flushPending());
    }
  }

  void dispose() {
    _donateTimer?.cancel();
    _bridge?.detach();
  }

  void _scheduleDonate() {
    _donateTimer?.cancel();
    _donateTimer = Timer(_kDonateDebounce, () {
      unawaited(_donate());
    });
  }

  Future<void> _donate() async {
    if (!_ref.mounted) {
      return;
    }
    try {
      final AssistantEntityDonation donation =
          await buildAssistantEntityDonation(_ref);
      if (!_ref.mounted) {
        return;
      }
      _ref.read(assistantEntityIndexProvider.notifier).index =
          AssistantEntityIndex.fromDonation(donation);
      await _bridge?.donateEntities(donation);
      await _flushPending();
    } on Object catch (error, stackTrace) {
      talker
        ..warning('[Assistant] Entity donation failed: $error')
        ..debug('[Assistant] $stackTrace');
    }
  }

  Future<void> _clear() async {
    if (!_ref.mounted) {
      return;
    }
    _ref.read(assistantEntityIndexProvider.notifier).index =
        const AssistantEntityIndex();
    await _bridge?.donateEntities(
      const AssistantEntityDonation(
        friends: <AssistantFriendEntity>[],
        guilds: <AssistantGuildEntity>[],
        channels: <AssistantChannelEntity>[],
      ),
    );
  }

  Future<void> _flushPending() async {
    if (!_ref.mounted) {
      return;
    }
    if (!readAssistantCommandSnapshot(_ref).isNavigationReady) {
      return;
    }
    await _bridge?.flushPending(
      accountUserId: _ref.read(currentUserIdProvider),
    );
  }
}

Future<AssistantEntityDonation> buildAssistantEntityDonation(Ref ref) async {
  final List<Friend> friends =
      ref.read(friendsListProvider).asData?.value ?? const <Friend>[];
  final List<AssistantFriendEntity> friendEntities = friends
      .where((Friend friend) => friend.friendStatus == FriendStatus.accepted)
      .map(
        (Friend friend) => AssistantFriendEntity(
          id: friend.id,
          name: friend.displayName,
          username: friend.username,
          avatarUrl: assistantFriendAvatarUrl(
            userId: friend.id,
            hash: friend.avatar,
          ),
        ),
      )
      .toList(growable: false);

  final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
  final List<AssistantGuildEntity> guildEntities = guilds
      .map(
        (Guild guild) => AssistantGuildEntity(id: guild.id, name: guild.name),
      )
      .toList(growable: false);
  final Map<String, String> guildNames = <String, String>{
    for (final Guild guild in guilds) guild.id: guild.name,
  };

  final List<AssistantChannelEntity> channels = <AssistantChannelEntity>[];
  if (ref.exists(fluxerDatabaseProvider)) {
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final List<db.Channel> rows = await database.channelDao.getAllChannels();
    for (final db.Channel row in rows) {
      if (!isGuildVoiceChannelType(row.type)) {
        continue;
      }
      channels.add(
        AssistantChannelEntity(
          id: row.id,
          name: row.name,
          kind: assistantChannelKindVoice,
          guildId: row.guildId,
          guildName: guildNames[row.guildId],
        ),
      );
    }
  }

  return AssistantEntityDonation(
    accountUserId: ref.read(currentUserIdProvider),
    friends: friendEntities,
    guilds: guildEntities,
    channels: channels,
  );
}

String _assistantChannelDonationToken(List<Channel> channels) {
  final StringBuffer buffer = StringBuffer();
  for (final Channel channel in channels) {
    if (channel.type != ChannelType.guildVoice) {
      continue;
    }
    buffer
      ..write(channel.id)
      ..write(':')
      ..write(channel.name)
      ..write(':')
      ..write(channel.type)
      ..write(':')
      ..write(channel.guildId)
      ..write(';');
  }
  return buffer.toString();
}
