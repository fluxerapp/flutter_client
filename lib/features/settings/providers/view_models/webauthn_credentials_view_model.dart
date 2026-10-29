import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'webauthn_credentials_view_model.g.dart';

class WebauthnCredentialsViewState {
  const WebauthnCredentialsViewState({
    this.isLoading = true,
    this.error,
    this.credentials = const [],
  });

  final bool isLoading;
  final String? error;
  final List<WebAuthnCredentialResponse> credentials;

  WebauthnCredentialsViewState copyWith({
    bool? isLoading,
    String? Function()? error,
    List<WebAuthnCredentialResponse>? credentials,
  }) {
    return WebauthnCredentialsViewState(
      isLoading: isLoading ?? this.isLoading,
      error: error != null ? error() : this.error,
      credentials: credentials ?? this.credentials,
    );
  }
}

@Riverpod(keepAlive: true)
class WebauthnCredentialsViewModel extends _$WebauthnCredentialsViewModel {
  int _updateSeq = 0;

  @override
  WebauthnCredentialsViewState build() {
    unawaited(Future.microtask(load));
    return const WebauthnCredentialsViewState();
  }

  void setCredentials(List<WebAuthnCredentialResponse> credentials) {
    _updateSeq++;
    state = state.copyWith(
      isLoading: false,
      credentials: credentials,
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
      final response = await client.users.listWebauthnCredentials();
      if (_updateSeq != seq) {
        return;
      }
      state = state.copyWith(
        isLoading: false,
        credentials: response,
        error: () => null,
      );
    } on Object catch (e, st) {
      talker.error('Failed to load WebAuthn credentials', e, st);
      if (_updateSeq != seq) {
        return;
      }
      state = state.copyWith(isLoading: false, error: e.toString);
    }
  }
}
