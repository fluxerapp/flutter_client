import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

import 'instance_runtime_config_override.dart';
import 'open_test_database.dart';
import 'test_account_user_id.dart';

List<Override> coreTestProviderOverrides({FluxerDatabase? database}) {
  return <Override>[
    instanceRuntimeConfigOverride(),
    currentUserIdProvider.overrideWithValue(kTestAccountUserId),
    fluxerDatabaseProvider.overrideWithValue(database ?? openTestDatabase()),
  ];
}
