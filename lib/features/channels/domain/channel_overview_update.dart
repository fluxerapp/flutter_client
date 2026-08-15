import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_dart/export.dart';

const int kMaxChannelTopicLength = 1024;
const int kMaxChannelNameLength = 100;
const int kMaxContentWarningTextLength = 200;
const int kDefaultVoiceConnectionLimit = 5;
const int kVoiceConnectionLimitMin = 1;
const int kVoiceConnectionLimitMax = 100;
const int kVoiceUserLimitMax = 99;

const List<int> kBitrateOptionsKbps = <int>[8, 64, 96, 128];

const List<int> kSlowmodeOptionsSeconds = <int>[
  0,
  5,
  10,
  15,
  30,
  60,
  120,
  300,
  600,
  900,
  1800,
  3600,
  7200,
  21600,
];

class ChannelOverviewFormState {
  const ChannelOverviewFormState({
    required this.name,
    required this.topic,
    required this.url,
    required this.slowmode,
    required this.nsfwOverride,
    required this.contentWarningLevel,
    required this.contentWarningText,
    required this.bitrateKbps,
    required this.userLimit,
    required this.voiceConnectionLimit,
    required this.rtcRegion,
  });

  final String name;
  final String topic;
  final String url;
  final int slowmode;
  final bool? nsfwOverride;
  final int contentWarningLevel;
  final String contentWarningText;
  final int bitrateKbps;
  final int userLimit;
  final int voiceConnectionLimit;
  final String? rtcRegion;

  factory ChannelOverviewFormState.fromChannel(Channel channel) {
    return ChannelOverviewFormState(
      name: channel.name,
      topic: channel.topic ?? '',
      url: channel.url ?? '',
      slowmode: channel.rateLimitPerUser,
      nsfwOverride: channel.nsfwOverride,
      contentWarningLevel: channel.contentWarningLevel,
      contentWarningText: channel.contentWarningText ?? '',
      bitrateKbps: getNearestBitrateKbps(
        channel.bitrate == null ? 64 : (channel.bitrate! / 1000).round(),
      ),
      userLimit: channel.userLimit ?? 0,
      voiceConnectionLimit:
          channel.voiceConnectionLimit ?? kDefaultVoiceConnectionLimit,
      rtcRegion: channel.rtcRegion,
    );
  }

  bool isDirtyComparedTo(ChannelOverviewFormState original) {
    return name != original.name ||
        topic != original.topic ||
        url != original.url ||
        slowmode != original.slowmode ||
        nsfwOverride != original.nsfwOverride ||
        contentWarningLevel != original.contentWarningLevel ||
        contentWarningText != original.contentWarningText ||
        bitrateKbps != original.bitrateKbps ||
        userLimit != original.userLimit ||
        voiceConnectionLimit != original.voiceConnectionLimit ||
        rtcRegion != original.rtcRegion;
  }

  static const Object _unset = Object();

  ChannelOverviewFormState copyWith({
    String? name,
    String? topic,
    String? url,
    int? slowmode,
    Object? nsfwOverride = _unset,
    int? contentWarningLevel,
    String? contentWarningText,
    int? bitrateKbps,
    int? userLimit,
    int? voiceConnectionLimit,
    Object? rtcRegion = _unset,
  }) {
    return ChannelOverviewFormState(
      name: name ?? this.name,
      topic: topic ?? this.topic,
      url: url ?? this.url,
      slowmode: slowmode ?? this.slowmode,
      nsfwOverride: identical(nsfwOverride, _unset)
          ? this.nsfwOverride
          : nsfwOverride as bool?,
      contentWarningLevel: contentWarningLevel ?? this.contentWarningLevel,
      contentWarningText: contentWarningText ?? this.contentWarningText,
      bitrateKbps: bitrateKbps ?? this.bitrateKbps,
      userLimit: userLimit ?? this.userLimit,
      voiceConnectionLimit: voiceConnectionLimit ?? this.voiceConnectionLimit,
      rtcRegion: identical(rtcRegion, _unset)
          ? this.rtcRegion
          : rtcRegion as String?,
    );
  }
}

int getNearestBitrateKbps(int value) {
  return kBitrateOptionsKbps.reduce(
    (int closest, int option) =>
        (option - value).abs() < (closest - value).abs() ? option : closest,
  );
}

int getNearestSlowmodeSeconds(int value) {
  return kSlowmodeOptionsSeconds.reduce(
    (int closest, int option) =>
        (option - value).abs() < (closest - value).abs() ? option : closest,
  );
}

bool isChannelTopicTooLong(String topic) {
  return topic.length > kMaxChannelTopicLength;
}

ContentWarningLevel? _contentWarningLevelForPatch(int? value) {
  if (value == null) {
    return null;
  }
  return ContentWarningLevel.fromJson(value);
}

ChannelUpdateRequest buildChannelOverviewUpdate({
  required Channel channel,
  required ChannelOverviewFormState current,
  required ChannelOverviewFormState original,
  required bool canManageChannel,
  required bool canUpdateRtcRegion,
}) {
  final String? name = canManageChannel && current.name != original.name
      ? current.name.trim()
      : null;
  final String? url =
      canManageChannel &&
          channel.type == ChannelType.guildLink &&
          current.url != original.url
      ? current.url.trim()
      : null;
  final String? topic =
      canManageChannel &&
          isGuildTextBasedChannelType(channel.type) &&
          current.topic != original.topic
      ? current.topic
      : null;
  final int? rateLimitPerUser =
      canManageChannel &&
          isGuildTextBasedChannelType(channel.type) &&
          current.slowmode != original.slowmode
      ? current.slowmode
      : null;
  final bool? nsfwOverride =
      canManageChannel && current.nsfwOverride != original.nsfwOverride
      ? current.nsfwOverride
      : null;
  final ContentWarningLevel? contentWarningLevel =
      canManageChannel &&
          current.contentWarningLevel != original.contentWarningLevel
      ? _contentWarningLevelForPatch(current.contentWarningLevel)
      : null;
  final String? contentWarningText =
      canManageChannel &&
          current.contentWarningText != original.contentWarningText
      ? (current.contentWarningText.isEmpty ? null : current.contentWarningText)
      : null;
  final int? bitrate =
      canManageChannel &&
          channel.type == ChannelType.guildVoice &&
          current.bitrateKbps != original.bitrateKbps
      ? current.bitrateKbps * 1000
      : null;
  final int? userLimit =
      canManageChannel &&
          channel.type == ChannelType.guildVoice &&
          current.userLimit != original.userLimit
      ? current.userLimit
      : null;
  final int? voiceConnectionLimit =
      canManageChannel &&
          channel.type == ChannelType.guildVoice &&
          current.voiceConnectionLimit != original.voiceConnectionLimit
      ? current.voiceConnectionLimit
      : null;
  final String? rtcRegion =
      canUpdateRtcRegion &&
          channel.type == ChannelType.guildVoice &&
          current.rtcRegion != original.rtcRegion
      ? current.rtcRegion
      : null;
  return switch (channel.type) {
    ChannelType.guildText => ChannelUpdateRequest0(
      topic: topic,
      url: url,
      parentId: null,
      bitrate: bitrate,
      userLimit: userLimit,
      voiceConnectionLimit: voiceConnectionLimit,
      permissionOverwrites: null,
      nsfw: null,
      nsfwOverride: nsfwOverride,
      contentWarningLevel: contentWarningLevel,
      contentWarningText: contentWarningText,
      rateLimitPerUser: rateLimitPerUser,
      icon: null,
      ownerId: null,
      nicks: null,
      rtcRegion: rtcRegion,
      type: GuildTextChannelUpdateRequestTypeType.guildText,
      name: name,
    ),
    ChannelType.guildVoice => ChannelUpdateRequest2(
      topic: topic,
      url: url,
      parentId: null,
      bitrate: bitrate,
      userLimit: userLimit,
      voiceConnectionLimit: voiceConnectionLimit,
      permissionOverwrites: null,
      nsfw: null,
      nsfwOverride: nsfwOverride,
      contentWarningLevel: contentWarningLevel,
      contentWarningText: contentWarningText,
      rateLimitPerUser: rateLimitPerUser,
      icon: null,
      ownerId: null,
      nicks: null,
      rtcRegion: rtcRegion,
      type: GuildVoiceChannelUpdateRequestTypeType.guildVoice,
      name: name,
    ),
    ChannelType.guildCategory => ChannelUpdateRequest4(
      topic: topic,
      url: url,
      parentId: null,
      bitrate: bitrate,
      userLimit: userLimit,
      voiceConnectionLimit: voiceConnectionLimit,
      permissionOverwrites: null,
      nsfw: null,
      nsfwOverride: nsfwOverride,
      contentWarningLevel: contentWarningLevel,
      contentWarningText: contentWarningText,
      rateLimitPerUser: rateLimitPerUser,
      icon: null,
      ownerId: null,
      nicks: null,
      rtcRegion: rtcRegion,
      type: GuildCategoryChannelUpdateRequestTypeType.guildCategory,
      name: name,
    ),
    ChannelType.guildLink => ChannelUpdateRequest998(
      topic: topic,
      url: url,
      parentId: null,
      bitrate: bitrate,
      userLimit: userLimit,
      voiceConnectionLimit: voiceConnectionLimit,
      permissionOverwrites: null,
      nsfw: null,
      nsfwOverride: nsfwOverride,
      contentWarningLevel: contentWarningLevel,
      contentWarningText: contentWarningText,
      rateLimitPerUser: rateLimitPerUser,
      icon: null,
      ownerId: null,
      nicks: null,
      rtcRegion: rtcRegion,
      type: GuildLinkChannelUpdateRequestTypeType.guildLink,
      name: name,
    ),
    _ => throw UnsupportedError(
      'Channel overview updates are not supported for ${channel.type}',
    ),
  };
}

Set<String> overviewUpdateIncludeNullFields({
  required ChannelOverviewFormState current,
  required ChannelOverviewFormState original,
  required bool canManageChannel,
}) {
  final Set<String> fields = <String>{};
  if (canManageChannel && current.nsfwOverride != original.nsfwOverride) {
    fields.add('nsfw_override');
  }
  if (canManageChannel &&
      current.contentWarningText != original.contentWarningText &&
      current.contentWarningText.trim().isEmpty) {
    fields.add('content_warning_text');
  }
  return fields;
}

Map<String, dynamic> buildChannelOverviewPatchBody({
  required Channel channel,
  required ChannelOverviewFormState current,
  required ChannelOverviewFormState original,
  required bool canManageChannel,
  required bool canUpdateRtcRegion,
}) {
  final ChannelUpdateRequest request = buildChannelOverviewUpdate(
    channel: channel,
    current: current,
    original: original,
    canManageChannel: canManageChannel,
    canUpdateRtcRegion: canUpdateRtcRegion,
  );
  final Set<String> includeNullFields = overviewUpdateIncludeNullFields(
    current: current,
    original: original,
    canManageChannel: canManageChannel,
  );
  final Map<String, dynamic> patch = channelUpdateRequestToPatchBody(request);
  // SDK toJson skips nulls, but inherit still needs explicit null in the PATCH body.
  if (includeNullFields.contains('nsfw_override')) {
    patch['nsfw_override'] = current.nsfwOverride;
  }
  if (includeNullFields.contains('content_warning_text')) {
    final String trimmed = current.contentWarningText.trim();
    patch['content_warning_text'] = trimmed.isEmpty ? null : trimmed;
  }
  return patch;
}

Map<String, dynamic> channelUpdateRequestToPatchBody(
  ChannelUpdateRequest request,
) {
  final Map<String, dynamic> body = request.toJson();
  final Map<String, dynamic> patch = <String, dynamic>{};
  for (final MapEntry<String, dynamic> entry in body.entries) {
    if (entry.value != null) {
      patch[entry.key] = entry.value;
    }
  }
  return patch;
}
