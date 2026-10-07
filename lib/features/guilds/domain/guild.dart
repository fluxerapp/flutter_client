import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';

export 'package:fluxer_app/core/media/fluxer_media_cdn.dart'
    show fluxerMediaCdn;

class Guild {
  final String id;
  final String name;
  final String? icon;
  final String? banner;
  final String? splash;
  final String? embedSplash;
  final int memberCount;
  final int onlineCount;
  final String? ownerId;
  final int position;
  final List<String> features;
  final bool unavailable;
  final int disabledOperations;
  final int verificationLevel;
  final bool nsfw;
  final int contentWarningLevel;
  final String? contentWarningText;
  final String? vanityUrlCode;

  const Guild({
    required this.id,
    required this.name,
    this.icon,
    this.banner,
    this.splash,
    this.embedSplash,
    this.memberCount = 0,
    this.onlineCount = 0,
    this.ownerId,
    this.position = 0,
    this.features = const [],
    this.unavailable = false,
    this.disabledOperations = 0,
    this.verificationLevel = 0,
    this.nsfw = false,
    this.contentWarningLevel = 0,
    this.contentWarningText,
    this.vanityUrlCode,
  });

  factory Guild.fromRow(db.Server row) {
    return Guild(
      id: row.id,
      name: row.name,
      icon: row.icon,
      banner: row.banner,
      splash: row.splash,
      embedSplash: row.embedSplash,
      memberCount: row.memberCount,
      onlineCount: row.onlineCount,
      ownerId: row.ownerId,
      position: row.position,
      features: (jsonDecode(row.featuresJson) as List<dynamic>).cast<String>(),
      unavailable: row.unavailable,
      disabledOperations: row.disabledOperations,
      verificationLevel: row.verificationLevel,
      nsfw: row.nsfw,
      contentWarningLevel: row.contentWarningLevel,
      contentWarningText: row.contentWarningText,
      vanityUrlCode: row.vanityUrlCode,
    );
  }

  bool get isVerified => features.contains('VERIFIED');
  bool get isPartnered => features.contains('PARTNERED');
  bool get isDiscoverable => features.contains('DISCOVERABLE');
  bool get hasVoiceE2ee => features.contains('VOICE_E2EE');
  bool get isStaffOnlyAccessible =>
      features.contains('UNAVAILABLE_FOR_EVERYONE_BUT_STAFF');
  bool get isUnavailable => unavailable || isStaffOnlyAccessible;

  /// Whether sending messages is disabled guild-wide.
  ///
  /// `SEND_MESSAGE` is bit `1 << 4` of the `disabled_operations` bitmask.
  bool get isSendDisabled => (disabledOperations & (1 << 4)) != 0;

  /// Whether member list gateway updates are disabled guild-wide.
  ///
  /// `MEMBER_LIST_UPDATES` is bit `1 << 6` of the `disabled_operations` bitmask.
  bool get isMemberListUpdatesDisabled => (disabledOperations & (1 << 6)) != 0;

  bool get hasAnimatedIcon => icon?.startsWith('a_') ?? false;
  bool get hasAnimatedBanner => banner?.startsWith('a_') ?? false;

  String? get iconUrl {
    return FluxerMediaUrl.guildIcon(guildId: id, hash: icon);
  }

  String? get animatedIconUrl {
    if (!hasAnimatedIcon) {
      return null;
    }
    return FluxerMediaUrl.guildIcon(guildId: id, hash: icon, animated: true);
  }

  String? get bannerUrl {
    return FluxerMediaUrl.guildBanner(
      guildId: id,
      hash: banner,
      animated: hasAnimatedBanner,
    );
  }

  String? get splashUrl {
    return FluxerMediaUrl.guildSplash(guildId: id, hash: splash);
  }

  String? get embedSplashUrl {
    return FluxerMediaUrl.guildEmbedSplash(guildId: id, hash: embedSplash);
  }
}
