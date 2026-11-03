import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

import 'instance_runtime_config_override.dart';
import 'message_item_test_overrides.dart';
import 'open_test_database.dart';
import 'test_account_user_id.dart';

List<Override> coreTestProviderOverrides({
  FluxerDatabase? database,
  List<Override> extra = const <Override>[],
}) {
  return mergeProviderOverrides(<Override>[
    instanceRuntimeConfigOverride(),
    currentUserIdProvider.overrideWithValue(kTestAccountUserId),
    fluxerDatabaseProvider.overrideWithValue(database ?? openTestDatabase()),
    ...messageItemTestProviderOverrides(),
    ...extra,
  ]);
}

List<Override> mergeProviderOverrides(Iterable<Override> overrides) {
  final Map<Object, Override> merged = <Object, Override>{};
  for (final Override override in overrides) {
    merged[override.origin] = override;
  }
  return merged.values.toList();
}
