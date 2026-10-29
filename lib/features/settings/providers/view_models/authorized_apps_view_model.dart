import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authorized_apps_view_model.g.dart';

class AuthorizedAppsViewState {
  const AuthorizedAppsViewState({
    this.isLoading = true,
    this.error,
    this.authorizations = const [],
  });

  final bool isLoading;
  final String? error;
  final List<OAuth2AuthorizationResponse> authorizations;

  AuthorizedAppsViewState copyWith({
    bool? isLoading,
    String? Function()? error,
    List<OAuth2AuthorizationResponse>? authorizations,
  }) {
    return AuthorizedAppsViewState(
      isLoading: isLoading ?? this.isLoading,
      error: error != null ? error() : this.error,
      authorizations: authorizations ?? this.authorizations,
    );
  }
}

@riverpod
class AuthorizedAppsViewModel extends _$AuthorizedAppsViewModel {
  @override
  AuthorizedAppsViewState build() {
    unawaited(Future.microtask(load));
    return const AuthorizedAppsViewState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true, error: () => null);
    try {
      final client = ref.read(fluxerClientProvider);
      final result = await client.oAuth2.listUserOauth2Authorizations();
      state = state.copyWith(isLoading: false, authorizations: result);
    } on Object catch (e, st) {
      talker.error('Failed to load authorized apps', e, st);
      state = state.copyWith(isLoading: false, error: () => 'failed');
    }
  }

  Future<void> deauthorize(String applicationId) async {
    try {
      final client = ref.read(fluxerClientProvider);
      await client.oAuth2.deleteUserOauth2Authorization(
        applicationId: applicationId,
      );
      state = state.copyWith(
        authorizations: state.authorizations
            .where((a) => a.application.id != applicationId)
            .toList(),
      );
    } on Object catch (e, st) {
      talker.error('Failed to deauthorize application', e, st);
      await showApiErrorFromRoot(ApiErrorAction.generic, e);
    }
  }
}
