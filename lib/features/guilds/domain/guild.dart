import 'dart:convert';

import 'package:drift/drift.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/guilds/utils/guild_notification_resolution.dart';
import 'package:fluxer_dart/export.dart';

export 'package:fluxer_app/core/media/fluxer_media_cdn.dart'
    show fluxerMediaCdn;

class Guild {
  final String id;
  final String name;
  final String? icon;
  final String? banner;
  final String? splash;
  final String? embedSplash;
  final int splashCardAlignment;
  final DateTime? messageHistoryCutoff;
  final int memberCount;
  final int onlineCount;
  final String? description;
  final String? ownerId;
  final int position;
  final List<String> features;
  final bool unavailable;
  final int disabledOperations;
  final int verificationLevel;
  final int mfaLevel;
  final bool nsfw;
  final int contentWarningLevel;
  final String? contentWarningText;
  final int defaultMessageNotifications;

  const Guild({
    required this.id,
    required this.name,
    this.icon,
    this.banner,
    this.splash,
    this.embedSplash,
    this.splashCardAlignment = 0,
    this.messageHistoryCutoff,
    this.memberCount = 0,
    this.onlineCount = 0,
    this.description,
    this.ownerId,
    this.position = 0,
    this.features = const [],
    this.unavailable = false,
    this.disabledOperations = 0,
    this.verificationLevel = 0,
    this.mfaLevel = 0,
    this.nsfw = false,
    this.contentWarningLevel = 0,
    this.contentWarningText,
    this.defaultMessageNotifications = 0,
  });

  factory Guild.fromRow(db.Server row) {
    return Guild(
      id: row.id,
      name: row.name,
      icon: row.icon,
      banner: row.banner,
      splash: row.splash,
      embedSplash: row.embedSplash,
      splashCardAlignment: row.splashCardAlignment,
      messageHistoryCutoff: row.messageHistoryCutoff,
      memberCount: row.memberCount,
      onlineCount: row.onlineCount,
      description: row.description,
      ownerId: row.ownerId,
      position: row.position,
      features: (jsonDecode(row.featuresJson) as List<dynamic>).cast<String>(),
      unavailable: row.unavailable,
      disabledOperations: row.disabledOperations,
      verificationLevel: row.verificationLevel,
      mfaLevel: row.mfaLevel,
      nsfw: row.nsfw,
      contentWarningLevel: row.contentWarningLevel,
      contentWarningText: row.contentWarningText,
      defaultMessageNotifications: row.defaultMessageNotifications,
    );
  }

  db.ServersCompanion toCompanion() {
    return db.ServersCompanion.insert(
      id: id,
      name: name,
      icon: Value(icon),
      banner: Value(banner),
      splash: Value(splash),
      embedSplash: Value(embedSplash),
      splashCardAlignment: Value(splashCardAlignment),
      messageHistoryCutoff: Value(messageHistoryCutoff),
      memberCount: Value(memberCount),
      onlineCount: Value(onlineCount),
      description: Value(description),
      ownerId: Value(ownerId),
      position: Value(position),
      featuresJson: Value(jsonEncode(features)),
      unavailable: Value(unavailable),
      disabledOperations: Value(disabledOperations),
      verificationLevel: Value(verificationLevel),
      mfaLevel: Value(mfaLevel),
      nsfw: Value(nsfw),
      contentWarningLevel: Value(contentWarningLevel),
      contentWarningText: Value(contentWarningText),
      defaultMessageNotifications: Value(defaultMessageNotifications),
    );
  }

  bool get isVerified => features.contains('VERIFIED');
  bool get isPartnered => features.contains('PARTNERED');
  bool get isDiscoverable => features.contains('DISCOVERABLE');
  bool get hasVoiceE2ee => features.contains('VOICE_E2EE');
  bool get isUnavailable =>
      unavailable || features.contains('UNAVAILABLE_FOR_EVERYONE_BUT_STAFF');

  /// Whether sending messages is disabled guild-wide.
  ///
  /// `SEND_MESSAGE` is bit `1 << 4` of the `disabled_operations` bitmask.
  bool get isSendDisabled => (disabledOperations & (1 << 4)) != 0;

  int get effectiveVerificationLevel =>
      effectiveGuildVerificationLevel(verificationLevel, isDiscoverable);

  int get effectiveMessageNotifications {
    if (isLargeGuildForNotifications(
      memberCount: memberCount,
      features: features,
    )) {
      return UserNotificationSettings.onlyMentions.json!;
    }
    return defaultMessageNotifications;
  }

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
