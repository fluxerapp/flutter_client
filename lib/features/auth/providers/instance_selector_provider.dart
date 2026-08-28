import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_discovery_service.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/providers/add_account_instance_guard_provider.dart';
import 'package:fluxer_app/features/auth/providers/pending_registration_url_code_provider.dart';
import 'package:riverpod/riverpod.dart';
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

  Future<void> commitPendingInstanceForAuth() async {
    if (!_isolatesActiveInstance) {
      return;
    }
    final InstanceConfigSnapshot? pending = state.asData?.value.pendingSnapshot;
    if (pending != null) {
      ref.read(activeInstanceProvider.notifier).applySnapshot(pending);
    }
  }

  Future<bool> resetToOfficialDefault() async {
    final InstanceSelectorState? current = state.asData?.value;
    if (current == null) {
      return false;
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
    return true;
  }

  Future<bool> connectToUrl(String input) async {
    final InstanceSelectorState? current = state.asData?.value;
    if (current == null) {
      return false;
    }
    final String url = input.trim();
    final String? registrationUrlCode = parseRegistrationUrlCode(url);
    if (registrationUrlCode != null) {
      ref
          .read(pendingRegistrationUrlCodeProvider.notifier)
          .store(registrationUrlCode);
    }
    if (url.isEmpty) {
      ++_connectSeq;
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
      return true;
    }
    if (_normalizer.isOfficialInstanceInput(url)) {
      final int connectId = ++_connectSeq;
      if (!_isolatesActiveInstance) {
        ref.read(activeInstanceProvider.notifier).resetToOfficialDefault();
      }
      if (connectId != _connectSeq) {
        return false;
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
      return true;
    }
    final int connectId = ++_connectSeq;
    state = AsyncData(
      current.copyWith(
        instanceUrl: url,
        status: InstanceDiscoveryStatus.discovering,
        requiresDiscovery: true,
        clearError: true,
        clearPendingSnapshot: true,
      ),
    );
    try {
      if (_isolatesActiveInstance) {
        final InstanceConfigSnapshot snapshot = await ref
            .read(activeInstanceProvider.notifier)
            .discoverEndpoint(url);
        if (connectId != _connectSeq) {
          return false;
        }
        final List<RecentInstance> recentInstances = await ref
            .read(fluxerDatabaseProvider)
            .recentInstancesDao
            .touchRecentInstance(
              domain: snapshot.displayDomain,
              name: snapshot.instanceDisplayName,
            );
        if (connectId != _connectSeq) {
          return false;
        }
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
        return true;
      }
      final List<RecentInstance> recentInstances = await ref
          .read(activeInstanceProvider.notifier)
          .connectToEndpoint(url);
      if (connectId != _connectSeq) {
        return false;
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
      return true;
    } on InstanceDiscoveryException catch (error) {
      if (connectId != _connectSeq) {
        return false;
      }
      talker.warning(
        '[InstanceSelector] Discovery failed for "$url": '
        '${error.message}',
      );
      state = AsyncData(
        current.copyWith(
          instanceUrl: url,
          status: InstanceDiscoveryStatus.error,
          requiresDiscovery: true,
          errorMessage: error.message,
          clearPendingSnapshot: true,
        ),
      );
      return false;
    } on Object catch (error, stackTrace) {
      if (connectId != _connectSeq) {
        return false;
      }
      talker.error(
        '[InstanceSelector] Discovery failed for "$url"',
        error,
        stackTrace,
      );
      state = AsyncData(
        current.copyWith(
          instanceUrl: url,
          status: InstanceDiscoveryStatus.error,
          requiresDiscovery: true,
          errorMessage: error is DioException
              ? apiMessageFromDioException(error)
              : null,
          clearPendingSnapshot: true,
        ),
      );
      return false;
    }
  }

  void cancelPendingConnection() {
    final InstanceSelectorState? current = state.asData?.value;
    if (current == null ||
        current.status != InstanceDiscoveryStatus.discovering) {
      return;
    }
    ++_connectSeq;
    ref.read(activeInstanceProvider.notifier).cancelPendingConnection();
    state = AsyncData(
      current.copyWith(
        status: InstanceDiscoveryStatus.idle,
        requiresDiscovery: true,
        clearError: true,
        clearPendingSnapshot: true,
      ),
    );
  }

  void restoreCommittedSelection({
    required InstanceSelectorState selection,
    required InstanceConfigSnapshot activeInstance,
  }) {
    ++_connectSeq;
    final ActiveInstance activeInstanceNotifier = ref.read(
      activeInstanceProvider.notifier,
    )..cancelPendingConnection();
    if (!identical(ref.read(activeInstanceProvider), activeInstance)) {
      activeInstanceNotifier.applySnapshot(activeInstance);
    }
    final InstanceSelectorState? current = state.asData?.value;
    final List<RecentInstance> recentInstances =
        current?.recentInstances ?? selection.recentInstances;
    final InstanceSelectorState restored =
        identical(recentInstances, selection.recentInstances)
        ? selection
        : selection.copyWith(recentInstances: recentInstances);
    if (!identical(current, restored)) {
      state = AsyncData(restored);
    }
  }

  Future<void> removeRecentInstance(String domain) async {
    await ref
        .read(fluxerDatabaseProvider)
        .recentInstancesDao
        .removeRecentInstance(domain);
    final List<RecentInstance> recentInstances = await ref
        .read(fluxerDatabaseProvider)
        .recentInstancesDao
        .getRecentInstances();
    final InstanceSelectorState? current = state.asData?.value;
    if (current == null) {
      return;
    }
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
  return ref.watch(
    instanceSelectorProvider.select(
      (selector) => selector.maybeWhen(
        data: (InstanceSelectorState state) => state.canAuthenticate,
        orElse: () => true,
      ),
    ),
  );
}
