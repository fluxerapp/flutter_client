import 'package:fluxer_app/core/push/unified_push/unified_push_no_distributor_dismissal_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'unified_push_no_distributor_dismissal_provider.g.dart';

@riverpod
UnifiedPushNoDistributorDismissalStorage
unifiedPushNoDistributorDismissalStorage(Ref ref) {
  return SharedPreferencesUnifiedPushNoDistributorDismissalStorage(
    SharedPreferences.getInstance(),
  );
}
