import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'limit_context.g.dart';

LimitMatchContext buildUserLimitContext({required Iterable<String> traits}) {
  return LimitMatchContext(traits: traits.toSet(), guildFeatures: <String>{});
}

@Riverpod(keepAlive: true)
LimitMatchContext currentUserLimitContext(Ref ref) {
  final String? userId = accountUserIdOrNull(ref, watch: true);
  if (userId == null) {
    return buildUserLimitContext(traits: const <String>[]);
  }
  final List<String> traits = ref
      .watch(currentUserEntitlementsProvider(userId))
      .traits;
  return buildUserLimitContext(traits: traits);
}
