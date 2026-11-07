import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_platform_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_geo_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensitive_content_provider.g.dart';

const int _friendRelationshipType = 1;

class SensitiveContentState {
  const SensitiveContentState({
    this.isLoading = true,
    this.access = MatureAccess.minor,
    this.showLocked = true,
    this.appStorePolicy = false,
    this.inAppConsentAllowed = true,
    this.friendDmFilter = ClientSensitiveMediaFilterLevel.blur,
    this.nonFriendDmFilter = ClientSensitiveMediaFilterLevel.block,
    this.guildFilter = ClientSensitiveMediaFilterLevel.blur,
  });

  final bool isLoading;
  final MatureAccess access;
  final bool showLocked;
  final bool appStorePolicy;
  final bool inAppConsentAllowed;
  final ClientSensitiveMediaFilterLevel friendDmFilter;
  final ClientSensitiveMediaFilterLevel nonFriendDmFilter;
  final ClientSensitiveMediaFilterLevel guildFilter;
}

@Riverpod(keepAlive: true)
class SensitiveContent extends _$SensitiveContent {
  @override
  SensitiveContentState build() {
    final String? userId = ref.watch(currentUserIdProvider);
    final UserSettingsResponse? settings = ref.watch(
      userSettingsStatusProvider,
    );
    final String? accountUserId = accountUserIdOrNull(ref, watch: true);
    final UserPrivateResponse? user = accountUserId == null
        ? null
        : ref.watch(currentUserPrivateReadProvider(accountUserId));
    final MatureGeoStatus geo =
        ref.watch(matureGeoStatusProvider).value ?? MatureGeoStatus.none;
    final DeclaredAgeFloor floor = ref.watch(declaredAgeFloorProvider);
    final bool appStorePolicy = ref.watch(matureContentAppStorePolicyProvider);
    final bool serverAllowsMature = user?.nsfwAllowed ?? false;
    final bool deviceDeclaredMinor = floor != DeclaredAgeFloor.none;
    final bool iosOptIn = settings?.allowMatureContentOnIos ?? false;
    final MatureAccess access = user == null
        ? MatureAccess.minor
        : resolveMatureAccess(
            serverAllowsMature: serverAllowsMature,
            deviceDeclaredMinor: deviceDeclaredMinor,
            geo: geo,
            matureContentUnlocked: user.matureContentUnlocked ?? false,
            appStorePolicy: appStorePolicy,
            iosOptIn: iosOptIn,
          );
    final bool inAppConsentAllowed = !appStorePolicy || iosOptIn;
    final bool showLocked = resolveInAppShowLocked(
      appStorePolicy: appStorePolicy,
      serverAllowsMature: serverAllowsMature,
      deviceDeclaredMinor: deviceDeclaredMinor,
      iosOptIn: iosOptIn,
    );
    if (settings == null) {
      return SensitiveContentState(
        isLoading: userId != null,
        access: access,
        showLocked: showLocked,
        appStorePolicy: appStorePolicy,
        inAppConsentAllowed: inAppConsentAllowed,
      );
    }
    return SensitiveContentState(
      isLoading: false,
      access: access,
      showLocked: showLocked,
      appStorePolicy: appStorePolicy,
      inAppConsentAllowed: inAppConsentAllowed,
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
  }
}

@riverpod
Future<ClientSensitiveMediaFilterLevel> sensitiveMediaFilterForChannel(
  Ref ref,
  String channelId,
) async {
  final SensitiveContentState settings = ref.watch(sensitiveContentProvider);
  final ClientSensitiveMediaFilterLevel level = await _filterLevelForChannel(
    ref,
    settings,
    channelId,
  );
  if (settings.showLocked && level == ClientSensitiveMediaFilterLevel.show) {
    return ClientSensitiveMediaFilterLevel.blur;
  }
  return level;
}

Future<ClientSensitiveMediaFilterLevel> _filterLevelForChannel(
  Ref ref,
  SensitiveContentState settings,
  String channelId,
) async {
  ref.watch(friendsListProvider);
  if (settings.isLoading) {
    return ClientSensitiveMediaFilterLevel.blur;
  }
  final db.FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
  db.Channel? guildChannel = await database.channelDao.getChannelById(
    channelId,
  );
  final String? threadParentId =
      guildChannel != null && isThreadChannelType(guildChannel.type)
      ? guildChannel.parentId
      : null;
  if (threadParentId != null) {
    guildChannel = await database.channelDao.getChannelById(threadParentId);
  }
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
      if (settings.appStorePolicy) {
        return settings.guildFilter;
      }
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
  if (isDmGroupType(dmChannel.type)) {
    return settings.nonFriendDmFilter;
  }
  if (!isDmChannelType(dmChannel.type)) {
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
