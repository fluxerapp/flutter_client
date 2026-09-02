import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/limits/limit_resolver.dart';
import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/chat/utils/message_length_constants.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_length_limits_provider.g.dart';

WellKnownFluxerResponse? _cachedOrLiveWellKnown(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.maybeWhen(
    data: (WellKnownFluxerResponse response) => response,
    orElse: () => ref.watch(activeInstanceProvider).wellKnown,
  );
}

int _resolveMaxMessageLength({
  required WellKnownFluxerResponse? wellKnown,
  required LimitMatchContext context,
  required int fallback,
}) {
  if (wellKnown == null) {
    return fallback;
  }
  return resolveInstanceLimit(
    limits: wellKnown.limits,
    key: LimitKeys.maxMessageLength,
    context: context,
    fallback: fallback,
  );
}

@Riverpod(keepAlive: true)
int maxMessageLength(Ref ref) {
  final bool isPremium = ref.watch(isEffectivelyPremiumProvider);
  final int fallback = resolveMaxMessageLength(isPremium: isPremium);
  return _resolveMaxMessageLength(
    wellKnown: _cachedOrLiveWellKnown(ref),
    context: ref.watch(currentUserLimitContextProvider),
    fallback: fallback,
  );
}

@Riverpod(keepAlive: true)
int premiumMaxMessageLength(Ref ref) {
  return _resolveMaxMessageLength(
    wellKnown: _cachedOrLiveWellKnown(ref),
    context: buildUserLimitContext(traits: const <String>['premium']),
    fallback: kMaxMessageLengthPremium,
  );
}
