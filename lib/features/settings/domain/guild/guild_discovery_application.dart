import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';

class GuildDiscoveryApplication {
  const GuildDiscoveryApplication({
    required this.guildId,
    required this.status,
    required this.description,
    required this.categoryType,
    required this.primaryLanguage,
    required this.customTags,
    required this.appliedAt,
    this.reviewedAt,
    this.reviewReason,
    this.removedAt,
    this.removalReason,
  });

  final String guildId;
  final String status;
  final String description;
  final int categoryType;
  final String primaryLanguage;
  final List<String> customTags;
  final String appliedAt;
  final String? reviewedAt;
  final String? reviewReason;
  final String? removedAt;
  final String? removalReason;

  String? get displayReason => removalReason ?? reviewReason;

  factory GuildDiscoveryApplication.fromJson(Map<String, dynamic> json) {
    return GuildDiscoveryApplication(
      guildId: json['guild_id'] as String,
      status: json['status'] as String,
      description: json['description'] as String,
      categoryType: (json['category_type'] as num).toInt(),
      primaryLanguage:
          json['primary_language'] as String? ??
          DiscoveryConstants.defaultLanguage,
      customTags: (json['custom_tags'] as List<dynamic>? ?? <dynamic>[])
          .map((dynamic tag) => tag as String)
          .toList(),
      appliedAt: json['applied_at'] as String,
      reviewedAt: json['reviewed_at'] as String?,
      reviewReason: json['review_reason'] as String?,
      removedAt: json['removed_at'] as String?,
      removalReason: json['removal_reason'] as String?,
    );
  }
}

class GuildDiscoveryStatus {
  const GuildDiscoveryStatus({
    required this.eligible,
    required this.minMemberCount,
    this.application,
  });

  final bool eligible;
  final int minMemberCount;
  final GuildDiscoveryApplication? application;

  factory GuildDiscoveryStatus.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic>? applicationJson =
        json['application'] as Map<String, dynamic>?;
    return GuildDiscoveryStatus(
      eligible: json['eligible'] as bool? ?? false,
      minMemberCount: (json['min_member_count'] as num?)?.toInt() ?? 0,
      application: applicationJson == null
          ? null
          : GuildDiscoveryApplication.fromJson(applicationJson),
    );
  }
}

class GuildDiscoveryApplicationRequest {
  const GuildDiscoveryApplicationRequest({
    required this.description,
    required this.categoryType,
    required this.primaryLanguage,
    required this.customTags,
  });

  final String description;
  final int categoryType;
  final String primaryLanguage;
  final List<String> customTags;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'description': description,
      'category_type': categoryType,
      'primary_language': primaryLanguage,
      'custom_tags': customTags,
    };
  }
}
