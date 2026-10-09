import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';

bool composerSlowmodeIndicatorVisible(WidgetRef ref, String channelId) {
  if (channelId.isEmpty) {
    return false;
  }
  final int rateLimit = ref.watch(
    channelByIdProvider(
      channelId,
    ).select((channel) => channel.value?.rateLimitPerUser ?? 0),
  );
  return rateLimit > 0;
}
