import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'linked_devices_view_model.g.dart';

class LinkedDevicesViewState {
  const LinkedDevicesViewState({
    this.isLoading = true,
    this.error,
    this.sessions = const [],
    this.revokingIds = const {},
  });

  final bool isLoading;
  final String? error;
  final List<AuthSessionResponse> sessions;
  final Set<String> revokingIds;

  LinkedDevicesViewState copyWith({
    bool? isLoading,
    String? Function()? error,
    List<AuthSessionResponse>? sessions,
    Set<String>? revokingIds,
  }) {
    return LinkedDevicesViewState(
      isLoading: isLoading ?? this.isLoading,
      error: error != null ? error() : this.error,
      sessions: sessions ?? this.sessions,
      revokingIds: revokingIds ?? this.revokingIds,
    );
  }
}

@riverpod
class LinkedDevicesViewModel extends _$LinkedDevicesViewModel {
  @override
  LinkedDevicesViewState build() {
    unawaited(Future.microtask(load));
    return const LinkedDevicesViewState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: () => null);
    try {
      final client = ref.read(fluxerClientProvider);
      final result = await client.auth.listAuthSessions();
      state = state.copyWith(isLoading: false, sessions: result);
    } on Object catch (e, st) {
      talker.error('Failed to load auth sessions', e, st);
      state = state.copyWith(isLoading: false, error: () => 'failed');
    }
  }

  Future<void> logout(List<String> idHashes) async {
    if (idHashes.isEmpty) {
      return;
    }

    state = state.copyWith(revokingIds: {...state.revokingIds, ...idHashes});

    try {
      final client = ref.read(fluxerClientProvider);
      await client.auth.logoutAllSessions(
        body: LogoutAuthSessionsWithVerificationRequest(
          sessionIdHashes: idHashes,
        ),
      );
      final removed = idHashes.toSet();
      state = state.copyWith(
        sessions: state.sessions
            .where((s) => !removed.contains(s.idHash))
            .toList(),
        revokingIds: state.revokingIds.difference(removed),
      );
    } on Object catch (e, st) {
      talker.error('Failed to log out sessions', e, st);
      final attempted = idHashes.toSet();
      state = state.copyWith(
        revokingIds: state.revokingIds.difference(attempted),
      );
      rethrow;
    }
  }
}
