import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'limit_context.g.dart';

LimitMatchContext buildUserLimitContext({required Iterable<String> traits}) {
  return LimitMatchContext(
    traits: traits.toSet(),
    guildFeatures: <String>{},
  );
}

@Riverpod(keepAlive: true)
LimitMatchContext currentUserLimitContext(Ref ref) {
  final List<String> traits = ref.watch(currentUserEntitlementsProvider).traits;
  return buildUserLimitContext(traits: traits);
}
