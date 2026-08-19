import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_dart/export.dart';

const largeGuildMemberThreshold = 250;

bool isLargeGuildForNotifications({
  required int memberCount,
  List<String> features = const [],
}) {
  return memberCount > largeGuildMemberThreshold ||
      features.contains('LARGE_GUILD_OVERRIDE') ||
      features.contains('VERY_LARGE_GUILD');
}

bool isInheritedGuildNotificationLevel(UserNotificationSettings stored) {
  return stored == UserNotificationSettings.inherit ||
      stored == UserNotificationSettings.$unknown;
}

class GuildNotificationContext {
  const GuildNotificationContext({
    this.defaultMessageNotifications = 0,
    this.memberCount = 0,
    this.features = const [],
  });

  final int defaultMessageNotifications;
  final int memberCount;
  final List<String> features;

  int get effectiveMessageNotifications =>
      resolveGuildMessageNotificationsForDisplay(
        stored: UserNotificationSettings.inherit,
        defaultMessageNotifications: defaultMessageNotifications,
        memberCount: memberCount,
        features: features,
      );

  factory GuildNotificationContext.fromServer(Server? server) {
    if (server == null) {
      return const GuildNotificationContext();
    }
    try {
      return GuildNotificationContext(
        defaultMessageNotifications: server.defaultMessageNotifications,
        memberCount: server.memberCount,
        features: (jsonDecode(server.featuresJson) as List<dynamic>)
            .cast<String>(),
      );
    } on Object {
      return GuildNotificationContext(
        defaultMessageNotifications: server.defaultMessageNotifications,
        memberCount: server.memberCount,
      );
    }
  }
}

UserNotificationSettings resolveGuildMessageNotifications({
  required UserNotificationSettings stored,
  int defaultMessageNotifications = 0,
  int memberCount = 0,
  List<String> features = const [],
}) {
  return UserNotificationSettings.fromJson(
    resolveGuildMessageNotificationsForDisplay(
      stored: stored,
      defaultMessageNotifications: defaultMessageNotifications,
      memberCount: memberCount,
      features: features,
    ),
  );
}

UserNotificationSettings resolveGuildMessageNotificationsFromContext({
  required UserNotificationSettings stored,
  GuildNotificationContext? guildContext,
}) {
  final GuildNotificationContext context =
      guildContext ?? const GuildNotificationContext();
  return resolveGuildMessageNotifications(
    stored: stored,
    defaultMessageNotifications: context.defaultMessageNotifications,
    memberCount: context.memberCount,
    features: context.features,
  );
}

int resolveGuildMessageNotificationsForDisplay({
  required UserNotificationSettings stored,
  int memberCount = 0,
  List<String> features = const [],
  int defaultMessageNotifications = 0,
}) {
  if (!isInheritedGuildNotificationLevel(stored)) {
    return stored.json!;
  }

  if (isLargeGuildForNotifications(
    memberCount: memberCount,
    features: features,
  )) {
    return UserNotificationSettings.onlyMentions.json!;
  }

  return defaultMessageNotifications;
}
