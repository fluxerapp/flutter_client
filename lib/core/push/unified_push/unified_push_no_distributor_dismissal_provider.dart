import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_no_distributor_dismissal_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unified_push_no_distributor_dismissal_provider.g.dart';

@Riverpod(keepAlive: true)
UnifiedPushNoDistributorDismissalStorage
unifiedPushNoDistributorDismissalStorage(Ref ref) {
  return LocalUnifiedPushNoDistributorDismissalStorage(
    ref.watch(localSettingsStoreProvider),
  );
}
