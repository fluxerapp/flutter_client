import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/limits/limit_resolver.dart';
import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_message_max_duration_provider.g.dart';

@Riverpod(keepAlive: true)
int maxVoiceMessageDurationSeconds(Ref ref) {
  final LimitMatchContext context = ref.watch(currentUserLimitContextProvider);
  final int fallback =
      kDefaultFreeLimits[LimitKeys.maxVoiceMessageDuration] ?? 1200;
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.when(
    data: (WellKnownFluxerResponse response) => resolveInstanceLimit(
      limits: response.limits,
      key: LimitKeys.maxVoiceMessageDuration,
      context: context,
      fallback: fallback,
    ),
    loading: () => fallback,
    error: (_, _) => fallback,
  );
}
