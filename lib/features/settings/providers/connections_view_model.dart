import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connections_view_model.g.dart';

class ConnectionsViewState {
  const ConnectionsViewState({
    this.isLoading = true,
    this.error,
    this.connections = const [],
    this.pendingIds = const {},
    this.blueskyEnabled = true,
  });

  final bool isLoading;
  final String? error;
  final List<ConnectionResponse> connections;
  final Set<String> pendingIds;
  final bool blueskyEnabled;

  ConnectionsViewState copyWith({
    bool? isLoading,
    String? Function()? error,
    List<ConnectionResponse>? connections,
    Set<String>? pendingIds,
    bool? blueskyEnabled,
  }) {
    return ConnectionsViewState(
      isLoading: isLoading ?? this.isLoading,
      error: error != null ? error() : this.error,
      connections: connections ?? this.connections,
      pendingIds: pendingIds ?? this.pendingIds,
      blueskyEnabled: blueskyEnabled ?? this.blueskyEnabled,
    );
  }
}

@Riverpod(keepAlive: true)
class ConnectionsViewModel extends _$ConnectionsViewModel {
  int _updateSeq = 0;

  @override
  ConnectionsViewState build() {
    unawaited(Future.microtask(load));
    return ConnectionsViewState(
      blueskyEnabled:
          AppBuildConfig.isBlueskyEnabled &&
          ref.read(instanceRuntimeConfigProvider).blueskyEnabled,
    );
  }

  void setConnections(List<ConnectionResponse> connections) {
    _updateSeq++;
    state = state.copyWith(
      isLoading: false,
      connections: connections,
      error: () => null,
    );
  }

  Future<void> load({bool silent = false}) async {
    final seq = _updateSeq;
    if (!silent) {
      state = state.copyWith(isLoading: true, error: () => null);
    }
    try {
      final client = ref.read(fluxerClientProvider);
      final response = await client.connections.listConnections();
      if (_updateSeq != seq) {
        return;
      }
      state = state.copyWith(
        isLoading: false,
        connections: response,
        blueskyEnabled:
            AppBuildConfig.isBlueskyEnabled &&
            ref.read(instanceRuntimeConfigProvider).blueskyEnabled,
        error: () => null,
      );
    } on Object catch (e, st) {
      talker.error('Failed to load connections', e, st);
      if (_updateSeq != seq) {
        return;
      }
      state = state.copyWith(isLoading: false, error: e.toString);
    }
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    final current = [...state.connections];
    if (oldIndex < 0 ||
        oldIndex >= current.length ||
        newIndex < 0 ||
        newIndex >= current.length) {
      return;
    }
    final item = current.removeAt(oldIndex);
    current.insert(newIndex, item);
    final previous = state.connections;
    state = state.copyWith(connections: current);

    try {
      final client = ref.read(fluxerClientProvider);
      await client.connections.reorderConnections(
        body: ReorderConnectionsRequest(
          connectionIds: current.map((c) => c.id).toList(),
        ),
      );
    } on Object catch (e, st) {
      talker.error('Failed to reorder connections', e, st);
      state = state.copyWith(connections: previous);
      rethrow;
    }
  }

  Future<void> deleteConnection(String type, String id) async {
    final pending = {...state.pendingIds, id};
    state = state.copyWith(pendingIds: pending);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.connections.deleteConnection(type: type, connectionId: id);
      final next = state.connections.where((c) => c.id != id).toList();
      state = state.copyWith(connections: next);
    } on Object catch (e, st) {
      talker.error('Failed to delete connection', e, st);
      rethrow;
    } finally {
      final next = {...state.pendingIds}..remove(id);
      state = state.copyWith(pendingIds: next);
    }
  }

  Future<void> updateVisibility(
    String type,
    String id,
    int visibilityFlags,
  ) async {
    try {
      final client = ref.read(fluxerClientProvider);
      await client.connections.updateConnection(
        type: type,
        connectionId: id,
        body: UpdateConnectionRequest(visibilityFlags: visibilityFlags),
      );
      final next = state.connections.map((c) {
        if (c.id == id) {
          return ConnectionResponse(
            id: c.id,
            type: c.type,
            name: c.name,
            verified: c.verified,
            visibilityFlags: visibilityFlags,
            sortOrder: c.sortOrder,
          );
        }
        return c;
      }).toList();
      state = state.copyWith(connections: next);
    } on Object catch (e, st) {
      talker.error('Failed to update connection', e, st);
      rethrow;
    }
  }

  Future<ConnectionVerificationResponse> initiate({
    required String type,
    required String identifier,
  }) async {
    final client = ref.read(fluxerClientProvider);
    try {
      return await client.connections.initiateConnection(
        body: CreateConnectionRequest(
          type: CreateConnectionRequestTypeType.fromJson(type),
          identifier: identifier,
        ),
      );
    } on Object catch (e, st) {
      talker.error('Failed to initiate connection', e, st);
      rethrow;
    }
  }

  Future<void> verifyAndCreate(String initiationToken) async {
    final client = ref.read(fluxerClientProvider);
    try {
      final created = await client.connections.verifyAndCreateConnection(
        body: VerifyAndCreateConnectionRequest(
          initiationToken: initiationToken,
        ),
      );
      _updateSeq++;
      state = state.copyWith(connections: [...state.connections, created]);
    } on Object catch (e, st) {
      talker.error('Failed to verify connection', e, st);
      rethrow;
    }
  }

  Future<String> authorizeBluesky(String handle) async {
    final client = ref.read(fluxerClientProvider);
    try {
      final response = await client.connections.authorizeBlueskyConnection(
        body: BlueskyAuthorizeRequest(handle: handle),
      );
      return response.authorizeUrl;
    } on Object catch (e, st) {
      talker.error('Failed to authorize Bluesky', e, st);
      rethrow;
    }
  }
}
