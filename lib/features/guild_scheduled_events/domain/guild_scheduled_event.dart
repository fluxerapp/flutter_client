class GuildScheduledEvent {
  final String id;
  final String guildId;
  final String? channelId;
  final String creatorId;
  final String name;
  final String? description;
  final DateTime scheduledStartTime;
  final DateTime? scheduledEndTime;
  final int privacyLevel;
  final int status;
  final int entityType;
  final String? entityId;
  final String? location;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final int subscriberCount;

  const GuildScheduledEvent({
    required this.id,
    required this.guildId,
    this.channelId,
    required this.creatorId,
    required this.name,
    this.description,
    required this.scheduledStartTime,
    this.scheduledEndTime,
    required this.privacyLevel,
    required this.status,
    required this.entityType,
    this.entityId,
    this.location,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    this.subscriberCount = 0,
  });

  factory GuildScheduledEvent.fromJson(Map<String, dynamic> json) {
    return GuildScheduledEvent(
      id: json['id'] as String,
      guildId: json['guild_id'] as String,
      channelId: json['channel_id'] as String?,
      creatorId: json['creator_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      scheduledStartTime: DateTime.parse(json['scheduled_start_time'] as String),
      scheduledEndTime: json['scheduled_end_time'] != null
          ? DateTime.parse(json['scheduled_end_time'] as String)
          : null,
      privacyLevel: json['privacy_level'] as int,
      status: json['status'] as int,
      entityType: json['entity_type'] as int,
      entityId: json['entity_id'] as String?,
      location: json['location'] as String?,
      image: json['image'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      version: json['version'] as int,
      subscriberCount: json['subscriber_count'] as int? ?? 0,
    );
  }

  bool get isScheduled => status == 0;
  bool get isActive => status == 1;
  bool get isCompleted => status == 2;
  bool get isCancelled => status == 3;
}

enum GuildScheduledEventStatus {
  scheduled(0),
  active(1),
  completed(2),
  cancelled(3);

  const GuildScheduledEventStatus(this.value);
  final int value;
}

enum GuildScheduledEventEntityType {
  stageInstance(1),
  voice(2),
  external(3);

  const GuildScheduledEventEntityType(this.value);
  final int value;
}
