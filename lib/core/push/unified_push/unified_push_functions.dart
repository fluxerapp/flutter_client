import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:unifiedpush/unifiedpush.dart' as up;
import 'package:unifiedpush_ui/unifiedpush_ui.dart';

/// Adapter for UnifiedPush UI dialogs.
final class FluxerUnifiedPushFunctions extends UnifiedPushFunctions {
  FluxerUnifiedPushFunctions();

  @override
  Future<String?> getDistributor() {
    return up.UnifiedPush.getDistributor();
  }

  @override
  Future<List<String>> getDistributors() {
    return up.UnifiedPush.getDistributors();
  }

  @override
  Future<void> registerApp(String instance) async {
    final UnifiedPushService service = UnifiedPushService.instance;
    final String? vapid = await service.ensureVapidPublicKey();
    await service.applyVapidAndReregisterIfNeeded(vapid);
    await service.syncRegistration(force: true);
  }

  @override
  Future<void> saveDistributor(String distributor) async {
    await up.UnifiedPush.saveDistributor(distributor);
  }
}
