import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/features/chat/providers/messages/forward_destinations_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';

const String apiErrorCodeSlowmodeRateLimited = 'SLOWMODE_RATE_LIMITED';

bool isSlowmodeCoolingDown({
  required SlowmodeTracker tracker,
  required String channelId,
  required int rateLimitPerUser,
}) {
  if (channelId.isEmpty || rateLimitPerUser <= 0) {
    return false;
  }
  return tracker.remainingFor(channelId, rateLimitPerUser) > Duration.zero;
}

bool isForwardDestinationCoolingDown({
  required ForwardDestination destination,
  required SlowmodeTracker tracker,
}) {
  if (!destination.slowmodeEnabled) {
    return false;
  }
  return isSlowmodeCoolingDown(
    tracker: tracker,
    channelId: destination.channelId,
    rateLimitPerUser: destination.rateLimitPerUser,
  );
}

bool isAnySelectedDestinationCoolingDown({
  required SlowmodeTracker tracker,
  required Iterable<ForwardDestination> destinations,
  required Set<String> selectedChannelIds,
}) {
  for (final ForwardDestination destination in destinations) {
    if (!selectedChannelIds.contains(destination.channelId)) {
      continue;
    }
    if (isForwardDestinationCoolingDown(
      destination: destination,
      tracker: tracker,
    )) {
      return true;
    }
  }
  return false;
}

bool isSlowmodeRateLimitedError(Object error) {
  return error is DioException &&
      apiErrorCodeFromDioException(error) == apiErrorCodeSlowmodeRateLimited;
}

int? slowmodeRetryAfterMsFromError(Object error) {
  if (error is! DioException) {
    return null;
  }
  return retryAfterMsFromDioException(error);
}

void applySlowmodeRateLimitError({
  required SlowmodeTracker tracker,
  required String channelId,
  required Object error,
}) {
  if (!isSlowmodeRateLimitedError(error) || channelId.isEmpty) {
    return;
  }
  final int? retryAfterMs = slowmodeRetryAfterMsFromError(error);
  if (retryAfterMs != null) {
    tracker.updateCooldownRemaining(channelId, retryAfterMs);
  }
}
