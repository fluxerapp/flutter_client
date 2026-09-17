import 'package:fluxer_app/core/media/fluxer_media_url.dart';

const String assistantChannelKindVoice = 'voice';

String? assistantFriendAvatarUrl({
  required String userId,
  required String? hash,
}) {
  return FluxerMediaUrl.userAvatar(userId: userId, hash: hash) ??
      FluxerMediaUrl.defaultAvatar(userId: userId);
}

class AssistantFriendEntity {
  const AssistantFriendEntity({
    required this.id,
    required this.name,
    this.username,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final String? username;
  final String? avatarUrl;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'id': id,
      'name': name,
      'username': ?username,
      'avatarUrl': ?avatarUrl,
    };
  }
}

class AssistantGuildEntity {
  const AssistantGuildEntity({required this.id, required this.name});

  final String id;
  final String name;

  Map<String, Object?> toMap() => <String, Object?>{'id': id, 'name': name};
}

class AssistantChannelEntity {
  const AssistantChannelEntity({
    required this.id,
    required this.name,
    required this.kind,
    this.guildId,
    this.guildName,
  });

  final String id;
  final String name;
  final String kind;
  final String? guildId;
  final String? guildName;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'id': id,
      'name': name,
      'kind': kind,
      if (guildId != null) 'guildId': guildId,
      if (guildName != null) 'guildName': guildName,
    };
  }
}

class AssistantEntityDonation {
  const AssistantEntityDonation({
    required this.friends,
    required this.guilds,
    required this.channels,
    this.accountUserId,
  });

  final String? accountUserId;
  final List<AssistantFriendEntity> friends;
  final List<AssistantGuildEntity> guilds;
  final List<AssistantChannelEntity> channels;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'accountUserId': ?accountUserId,
      'friends': friends
          .map((AssistantFriendEntity e) => e.toMap())
          .toList(growable: false),
      'guilds': guilds
          .map((AssistantGuildEntity e) => e.toMap())
          .toList(growable: false),
      'channels': channels
          .map((AssistantChannelEntity e) => e.toMap())
          .toList(growable: false),
    };
  }
}
