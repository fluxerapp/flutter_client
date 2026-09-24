import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

GatewayCustomStatus? gatewayCustomStatusFromSettings(
  CustomStatusResponse? status,
) {
  final CustomStatusResponse? normalized = normalizeCustomStatus(status);
  if (normalized == null) {
    return null;
  }
  return GatewayCustomStatus(
    text: normalized.text,
    expiresAt: normalized.expiresAt?.toUtc().toIso8601String(),
    emojiId: normalized.emojiId,
    emojiName: normalized.emojiName,
    emojiAnimated: normalized.emojiAnimated,
  );
}

GatewayPresence buildGatewayLifecyclePresence({
  required bool isForeground,
  required String status,
  required bool mobile,
  required bool markAfkWhenBackgrounded,
  GatewayCustomStatus? customStatus,
}) {
  return GatewayPresence(
    status: status,
    afk: markAfkWhenBackgrounded && !isForeground,
    mobile: mobile,
    customStatus: customStatus,
  );
}

bool sameGatewayPresence(GatewayPresence a, GatewayPresence b) {
  return a.status == b.status &&
      a.afk == b.afk &&
      a.mobile == b.mobile &&
      a.customStatus?.text == b.customStatus?.text &&
      a.customStatus?.expiresAt == b.customStatus?.expiresAt &&
      a.customStatus?.emojiId == b.customStatus?.emojiId &&
      a.customStatus?.emojiName == b.customStatus?.emojiName &&
      a.customStatus?.emojiAnimated == b.customStatus?.emojiAnimated;
}
