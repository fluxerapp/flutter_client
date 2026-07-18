import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  const String guildId = 'guild-1';
  const Channel textChannel = Channel(
    id: 'text-1',
    guildId: guildId,
    name: 'general',
    topic: 'old topic',
  );
  const Channel voiceChannel = Channel(
    id: 'voice-1',
    guildId: guildId,
    name: 'voice',
    type: ChannelType.guildVoice,
    bitrate: 64000,
    userLimit: 0,
    voiceConnectionLimit: 5,
    rtcRegion: 'us-east',
  );

  group('buildChannelOverviewUpdate', () {
    test('includes only dirty text fields when user can manage channel', () {
      final ChannelOverviewFormState original =
          ChannelOverviewFormState.fromChannel(textChannel);
      final ChannelOverviewFormState current = ChannelOverviewFormState(
        name: 'renamed',
        topic: 'new topic',
        url: original.url,
        slowmode: 60,
        nsfwOverride: original.nsfwOverride,
        contentWarningLevel: original.contentWarningLevel,
        contentWarningText: original.contentWarningText,
        bitrateKbps: original.bitrateKbps,
        userLimit: original.userLimit,
        voiceConnectionLimit: original.voiceConnectionLimit,
        rtcRegion: original.rtcRegion,
      );
      final ChannelUpdateRequest request = buildChannelOverviewUpdate(
        channel: textChannel,
        current: current,
        original: original,
        canManageChannel: true,
        canUpdateRtcRegion: false,
      );
      final Map<String, dynamic> body = channelUpdateRequestToPatchBody(
        request,
      );
      expect(body['name'], 'renamed');
      expect(body['topic'], 'new topic');
      expect(body['rate_limit_per_user'], 60);
      expect(body.containsKey('bitrate'), isFalse);
    });

    test('omits fields when user cannot manage channel', () {
      final ChannelOverviewFormState original =
          ChannelOverviewFormState.fromChannel(textChannel);
      final ChannelOverviewFormState current = ChannelOverviewFormState(
        name: 'renamed',
        topic: 'new topic',
        url: original.url,
        slowmode: original.slowmode,
        nsfwOverride: original.nsfwOverride,
        contentWarningLevel: original.contentWarningLevel,
        contentWarningText: original.contentWarningText,
        bitrateKbps: original.bitrateKbps,
        userLimit: original.userLimit,
        voiceConnectionLimit: original.voiceConnectionLimit,
        rtcRegion: original.rtcRegion,
      );
      final ChannelUpdateRequest request = buildChannelOverviewUpdate(
        channel: textChannel,
        current: current,
        original: original,
        canManageChannel: false,
        canUpdateRtcRegion: false,
      );
      final Map<String, dynamic> body = channelUpdateRequestToPatchBody(
        request,
      );
      expect(body.containsKey('name'), isFalse);
      expect(body.containsKey('topic'), isFalse);
    });

    test('allows rtc region update without manageChannels', () {
      final ChannelOverviewFormState original =
          ChannelOverviewFormState.fromChannel(voiceChannel);
      final ChannelOverviewFormState current = ChannelOverviewFormState(
        name: original.name,
        topic: original.topic,
        url: original.url,
        slowmode: original.slowmode,
        nsfwOverride: original.nsfwOverride,
        contentWarningLevel: original.contentWarningLevel,
        contentWarningText: original.contentWarningText,
        bitrateKbps: original.bitrateKbps,
        userLimit: original.userLimit,
        voiceConnectionLimit: original.voiceConnectionLimit,
        rtcRegion: 'eu-west',
      );
      final ChannelUpdateRequest request = buildChannelOverviewUpdate(
        channel: voiceChannel,
        current: current,
        original: original,
        canManageChannel: false,
        canUpdateRtcRegion: true,
      );
      final Map<String, dynamic> body = channelUpdateRequestToPatchBody(
        request,
      );
      expect(body['rtc_region'], 'eu-west');
      expect(body.containsKey('bitrate'), isFalse);
    });

    test('includes voice fields when dirty and user can manage channel', () {
      final ChannelOverviewFormState original =
          ChannelOverviewFormState.fromChannel(voiceChannel);
      final ChannelOverviewFormState current = ChannelOverviewFormState(
        name: original.name,
        topic: original.topic,
        url: original.url,
        slowmode: original.slowmode,
        nsfwOverride: original.nsfwOverride,
        contentWarningLevel: original.contentWarningLevel,
        contentWarningText: original.contentWarningText,
        bitrateKbps: 128,
        userLimit: 10,
        voiceConnectionLimit: 8,
        rtcRegion: original.rtcRegion,
      );
      final ChannelUpdateRequest request = buildChannelOverviewUpdate(
        channel: voiceChannel,
        current: current,
        original: original,
        canManageChannel: true,
        canUpdateRtcRegion: false,
      );
      final Map<String, dynamic> body = channelUpdateRequestToPatchBody(
        request,
      );
      expect(body['bitrate'], 128000);
      expect(body['user_limit'], 10);
      expect(body['voice_connection_limit'], 8);
    });
  });

  group('isChannelTopicTooLong', () {
    test('returns false at limit and true above limit', () {
      expect(isChannelTopicTooLong('a' * kMaxChannelTopicLength), isFalse);
      expect(isChannelTopicTooLong('a' * (kMaxChannelTopicLength + 1)), isTrue);
    });
  });
}
