import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensitive_content_provider.g.dart';

const int _friendRelationshipType = 1;

class SensitiveContentState {
  const SensitiveContentState({
    this.isLoading = true,
    this.nsfwAllowed = true,
    this.friendDmFilter = ClientSensitiveMediaFilterLevel.show,
    this.nonFriendDmFilter = ClientSensitiveMediaFilterLevel.show,
    this.guildFilter = ClientSensitiveMediaFilterLevel.show,
  });

  final bool isLoading;
  final bool nsfwAllowed;
  final ClientSensitiveMediaFilterLevel friendDmFilter;
  final ClientSensitiveMediaFilterLevel nonFriendDmFilter;
  final ClientSensitiveMediaFilterLevel guildFilter;

  SensitiveContentState copyWith({
    bool? isLoading,
    bool? nsfwAllowed,
    ClientSensitiveMediaFilterLevel? friendDmFilter,
    ClientSensitiveMediaFilterLevel? nonFriendDmFilter,
    ClientSensitiveMediaFilterLevel? guildFilter,
  }) {
    return SensitiveContentState(
      isLoading: isLoading ?? this.isLoading,
      nsfwAllowed: nsfwAllowed ?? this.nsfwAllowed,
      friendDmFilter: friendDmFilter ?? this.friendDmFilter,
      nonFriendDmFilter: nonFriendDmFilter ?? this.nonFriendDmFilter,
      guildFilter: guildFilter ?? this.guildFilter,
    );
  }
}

@Riverpod(keepAlive: true)
class SensitiveContent extends _$SensitiveContent {
  @override
  SensitiveContentState build() {
    unawaited(load());
    return const SensitiveContentState();
  }

  Future<void> load() async {
    try {
      final FluxerClient client = ref.read(fluxerClientProvider);
      final UserSettingsResponse settings = await client.users
          .getCurrentUserSettings();
      final UserPrivateResponse user = await client.users.getCurrentUser();
      state = SensitiveContentState(
        isLoading: false,
        nsfwAllowed: user.nsfwAllowed,
        friendDmFilter: ClientSensitiveMediaFilterLevel.fromInt(
          settings.sensitiveContentFriendDmFilter.json ?? 0,
        ),
        nonFriendDmFilter: ClientSensitiveMediaFilterLevel.fromInt(
          settings.sensitiveContentNonFriendDmFilter.json ?? 0,
        ),
        guildFilter: ClientSensitiveMediaFilterLevel.fromInt(
          settings.sensitiveContentGuildFilter.json ?? 0,
        ),
      );
    } on Object catch (error, stackTrace) {
      talker.error(
        'Failed to load sensitive content settings',
        error,
        stackTrace,
      );
      state = state.copyWith(isLoading: false);
    }
  }
}

@riverpod
Future<ClientSensitiveMediaFilterLevel> sensitiveMediaFilterForChannel(
  Ref ref,
  String channelId,
) async {
  final SensitiveContentState settings = ref.watch(sensitiveContentProvider);
  ref.watch(friendsListProvider);
  if (settings.isLoading) {
    return ClientSensitiveMediaFilterLevel.blur;
  }
  final db.FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
  final db.Channel? guildChannel = await database.channelDao.getChannelById(
    channelId,
  );
  if (guildChannel != null) {
    final Channel channel = Channel.fromRow(guildChannel);
    final db.Server? guildRow = await database.guildDao.getServerById(
      channel.guildId,
    );
    final Guild? guild = guildRow == null ? null : Guild.fromRow(guildRow);
    Channel? parentCategory;
    final String? parentId = channel.parentId;
    if (parentId != null) {
      final db.Channel? parentRow = await database.channelDao.getChannelById(
        parentId,
      );
      if (parentRow != null) {
        final Channel parent = Channel.fromRow(parentRow);
        if (parent.isCategory) {
          parentCategory = parent;
        }
      }
    }
    if (getEffectiveChannelMatureContent(
      channel: channel,
      guild: guild,
      parentCategory: parentCategory,
    )) {
      return ClientSensitiveMediaFilterLevel.show;
    }
    return settings.guildFilter;
  }
  final db.DmChannel? dmChannel = await database.dmChannelDao.getDmChannelById(
    channelId,
  );
  if (dmChannel == null) {
    return ClientSensitiveMediaFilterLevel.show;
  }
  if (dmChannel.type == groupDmChannelType) {
    return settings.nonFriendDmFilter;
  }
  if (dmChannel.type != dmChannelType) {
    return ClientSensitiveMediaFilterLevel.show;
  }
  final String recipientId = dmChannel.recipientId;
  final String currentUserId = ref.watch(userSettingsViewModelProvider).userId;
  if (recipientId == currentUserId) {
    return ClientSensitiveMediaFilterLevel.show;
  }
  final List<db.Relationship> relationships = await database.relationshipDao
      .getRelationships();
  for (final db.Relationship relationship in relationships) {
    if (relationship.userId == recipientId &&
        relationship.type == _friendRelationshipType) {
      return settings.friendDmFilter;
    }
  }
  return settings.nonFriendDmFilter;
}
