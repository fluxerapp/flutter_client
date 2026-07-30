import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

List<Channel> filterTextChannels(List<Channel> channels) {
  return channels
      .where((Channel channel) => isGuildTextBasedChannelType(channel.type))
      .toList();
}

Map<String, String> channelNamesById(List<Channel> channels) {
  return <String, String>{
    for (final Channel channel in channels) channel.id: channel.name,
  };
}

List<WebhookResponse> sortGuildWebhooks(
  List<WebhookResponse> webhooks,
  Map<String, String> channelNames,
) {
  final List<WebhookResponse> sorted = List<WebhookResponse>.from(webhooks)
    ..sort((WebhookResponse a, WebhookResponse b) {
      final String channelA = channelNames[a.channelId] ?? '';
      final String channelB = channelNames[b.channelId] ?? '';
      final int channelCompare = channelA.toLowerCase().compareTo(
        channelB.toLowerCase(),
      );
      if (channelCompare != 0) {
        return channelCompare;
      }
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
  return sorted;
}

String resolveWebhookChannelName({
  required FluxerLocalizations l10n,
  required String channelId,
  required Map<String, String> channelNames,
}) {
  return channelNames[channelId] ?? l10n.guildSettingsUnknownChannel;
}
