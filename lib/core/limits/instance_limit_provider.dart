import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_resolver.dart';
import 'package:fluxer_app/core/limits/limit_toggle.dart';
import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instance_limit_provider.g.dart';

@Riverpod(keepAlive: true)
int instanceLimit(Ref ref, String key) {
  final LimitMatchContext context = ref.watch(currentUserLimitContextProvider);
  final int fallback = kDefaultFreeLimits[key] ?? -1;
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.when(
    data: (WellKnownFluxerResponse response) => resolveInstanceLimit(
      limits: response.limits,
      key: key,
      context: context,
      fallback: fallback,
    ),
    loading: () => fallback,
    error: (_, _) => fallback,
  );
}

@Riverpod(keepAlive: true)
bool instanceFeatureEnabled(Ref ref, String key) {
  final int resolved = ref.watch(instanceLimitProvider(key));
  return isLimitToggleEnabled(resolved);
}
