import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_discovery_service.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/providers/add_account_instance_guard_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instance_selector_provider.g.dart';

enum InstanceDiscoveryStatus { idle, discovering, success, error }

class InstanceSelectorState {
  const InstanceSelectorState({
    required this.instanceUrl,
    required this.status,
    required this.recentInstances,
    required this.requiresDiscovery,
    this.errorMessage,
    this.pendingSnapshot,
  });

  final String instanceUrl;
  final InstanceDiscoveryStatus status;
  final String? errorMessage;
  final List<RecentInstance> recentInstances;
  final bool requiresDiscovery;
  final InstanceConfigSnapshot? pendingSnapshot;

  bool get canAuthenticate {
    if (status == InstanceDiscoveryStatus.discovering) {
      return false;
    }
    if (status == InstanceDiscoveryStatus.error) {
      return false;
    }
    if (requiresDiscovery && status != InstanceDiscoveryStatus.success) {
      return false;
    }
    return true;
  }

  InstanceSelectorState copyWith({
    String? instanceUrl,
    InstanceDiscoveryStatus? status,
    String? errorMessage,
    List<RecentInstance>? recentInstances,
    bool? requiresDiscovery,
    InstanceConfigSnapshot? pendingSnapshot,
    bool clearError = false,
    bool clearPendingSnapshot = false,
  }) {
    return InstanceSelectorState(
      instanceUrl: instanceUrl ?? this.instanceUrl,
      status: status ?? this.status,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      recentInstances: recentInstances ?? this.recentInstances,
      requiresDiscovery: requiresDiscovery ?? this.requiresDiscovery,
      pendingSnapshot: clearPendingSnapshot
          ? null
          : pendingSnapshot ?? this.pendingSnapshot,
    );
  }
}

@Riverpod(keepAlive: true)
class InstanceSelector extends _$InstanceSelector {
  int _connectSeq = 0;
  static const InstanceEndpointNormalizer _normalizer =
      InstanceEndpointNormalizer();

  bool get _isolatesActiveInstance =>
      ref.read(addAccountInstanceGuardProvider) != null;

  @override
  Future<InstanceSelectorState> build() async {
    final String instanceUrl = ref
        .read(activeInstanceProvider.notifier)
        .describeApiEndpoint();
    final List<RecentInstance> recentInstances = await ref
        .read(fluxerDatabaseProvider)
        .recentInstancesDao
        .getRecentInstances();
    return InstanceSelectorState(
      instanceUrl: instanceUrl,
      status: InstanceDiscoveryStatus.idle,
      recentInstances: recentInstances,
      requiresDiscovery: false,
    );
  }

  void updateInstanceUrl(String value) {
    final InstanceSelectorState? current = state.asData?.value;
    if (current == null) {
      return;
    }
    if (value.trim().isEmpty) {
      if (!_isolatesActiveInstance) {
        ref.read(activeInstanceProvider.notifier).resetToOfficialDefault();
      }
      state = AsyncData(
        current.copyWith(
          instanceUrl: value,
          requiresDiscovery: false,
          status: InstanceDiscoveryStatus.idle,
          clearError: true,
          clearPendingSnapshot: true,
        ),
      );
      return;
    }
    state = AsyncData(
      current.copyWith(
        instanceUrl: value,
        status: InstanceDiscoveryStatus.idle,
        requiresDiscovery: true,
        clearError: true,
        clearPendingSnapshot: true,
      ),
    );
  }

  Future<void> commitPendingInstanceForAuth() async {
    if (!_isolatesActiveInstance) {
      return;
    }
    final InstanceConfigSnapshot? pending = state.asData?.value.pendingSnapshot;
    if (pending != null) {
      ref.read(activeInstanceProvider.notifier).applySnapshot(pending);
    }
  }

  Future<void> resetToOfficialDefault() async {
    final InstanceSelectorState? current = state.asData?.value;
    if (current == null) {
      return;
    }
    ++_connectSeq;
    if (!_isolatesActiveInstance) {
      ref.read(activeInstanceProvider.notifier).resetToOfficialDefault();
    }
    const String describedUrl = InstanceConstants.defaultInstanceInputUrl;
    state = AsyncData(
      current.copyWith(
        instanceUrl: describedUrl,
        status: InstanceDiscoveryStatus.success,
        requiresDiscovery: false,
        clearError: true,
        clearPendingSnapshot: !_isolatesActiveInstance,
        pendingSnapshot: _isolatesActiveInstance
            ? InstanceConfigSnapshot.officialDefault()
            : null,
      ),
    );
  }

  Future<void> connectToCurrentUrl() async {
    final InstanceSelectorState? current = state.asData?.value;
    if (current == null) {
      return;
    }
    final String url = current.instanceUrl.trim();
    if (url.isEmpty) {
      if (!_isolatesActiveInstance) {
        ref.read(activeInstanceProvider.notifier).resetToOfficialDefault();
      }
      state = AsyncData(
        current.copyWith(
          instanceUrl: InstanceConstants.defaultInstanceInputUrl,
          status: InstanceDiscoveryStatus.success,
          requiresDiscovery: false,
          clearError: true,
          clearPendingSnapshot: !_isolatesActiveInstance,
          pendingSnapshot: _isolatesActiveInstance
              ? InstanceConfigSnapshot.officialDefault()
              : null,
        ),
      );
      return;
    }
    if (_normalizer.isOfficialInstanceInput(url)) {
      final int connectId = ++_connectSeq;
      if (!_isolatesActiveInstance) {
        ref.read(activeInstanceProvider.notifier).resetToOfficialDefault();
      }
      if (connectId != _connectSeq) {
        return;
      }
      final String describedUrl = _describeUserInstanceInput(url);
      state = AsyncData(
        current.copyWith(
          instanceUrl: describedUrl,
          status: InstanceDiscoveryStatus.success,
          requiresDiscovery: false,
          clearError: true,
          clearPendingSnapshot: !_isolatesActiveInstance,
          pendingSnapshot: _isolatesActiveInstance
              ? InstanceConfigSnapshot.officialDefault()
              : null,
        ),
      );
      return;
    }
    final int connectId = ++_connectSeq;
    state = AsyncData(
      current.copyWith(
        status: InstanceDiscoveryStatus.discovering,
        clearError: true,
      ),
    );
    try {
      if (_isolatesActiveInstance) {
        final InstanceConfigSnapshot snapshot = await ref
            .read(activeInstanceProvider.notifier)
            .discoverEndpoint(url);
        if (connectId != _connectSeq) {
          return;
        }
        final List<RecentInstance> recentInstances = await ref
            .read(fluxerDatabaseProvider)
            .recentInstancesDao
            .touchRecentInstance(
              domain: snapshot.displayDomain,
              name: snapshot.instanceDisplayName,
            );
        final String describedUrl = _normalizer.describeApiEndpoint(
          snapshot.apiBaseUrl,
        );
        state = AsyncData(
          current.copyWith(
            instanceUrl: describedUrl,
            status: InstanceDiscoveryStatus.success,
            requiresDiscovery: false,
            recentInstances: recentInstances,
            pendingSnapshot: snapshot,
            clearError: true,
          ),
        );
        return;
      }
      final List<RecentInstance> recentInstances = await ref
          .read(activeInstanceProvider.notifier)
          .connectToEndpoint(url);
      if (connectId != _connectSeq) {
        return;
      }
      final String describedUrl = ref
          .read(activeInstanceProvider.notifier)
          .describeApiEndpoint();
      state = AsyncData(
        current.copyWith(
          instanceUrl: describedUrl,
          status: InstanceDiscoveryStatus.success,
          requiresDiscovery: false,
          recentInstances: recentInstances,
          clearError: true,
        ),
      );
    } on InstanceDiscoveryException catch (error) {
      if (connectId != _connectSeq) {
        return;
      }
      talker.warning(
        '[InstanceSelector] Discovery failed for "${current.instanceUrl}": '
        '${error.message}',
      );
      state = AsyncData(
        current.copyWith(
          status: InstanceDiscoveryStatus.error,
          errorMessage: error.message,
        ),
      );
    } on Object catch (error, stackTrace) {
      if (connectId != _connectSeq) {
        return;
      }
      talker.error(
        '[InstanceSelector] Discovery failed for "${current.instanceUrl}"',
        error,
        stackTrace,
      );
      state = AsyncData(
        current.copyWith(
          status: InstanceDiscoveryStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> selectRecentInstance(RecentInstance instance) async {
    final InstanceSelectorState? current = state.asData?.value;
    if (current == null) {
      return;
    }
    state = AsyncData(current.copyWith(instanceUrl: instance.domain));
    await connectToCurrentUrl();
  }

  Future<void> removeRecentInstance(String domain) async {
    await ref
        .read(fluxerDatabaseProvider)
        .recentInstancesDao
        .removeRecentInstance(domain);
    final InstanceSelectorState? current = state.asData?.value;
    if (current == null) {
      return;
    }
    final List<RecentInstance> recentInstances = await ref
        .read(fluxerDatabaseProvider)
        .recentInstancesDao
        .getRecentInstances();
    state = AsyncData(current.copyWith(recentInstances: recentInstances));
  }

  String _describeUserInstanceInput(String url) {
    try {
      return _normalizer.describeApiEndpoint(
        _normalizer.normalizeEndpoint(url),
      );
    } on FormatException {
      return _normalizer.describeApiEndpoint(
        InstanceConstants.defaultApiBaseUrl,
      );
    }
  }
}

@riverpod
bool instanceSelectorCanAuthenticate(Ref ref) {
  final AsyncValue<InstanceSelectorState> selector = ref.watch(
    instanceSelectorProvider,
  );
  return selector.maybeWhen(
    data: (InstanceSelectorState state) => state.canAuthenticate,
    orElse: () => true,
  );
}
