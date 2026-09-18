import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'applications_view_model.g.dart';

enum ApplicationsSecretKind { client, bot }

class ApplicationsViewState {
  const ApplicationsViewState({
    this.isLoading = true,
    this.error,
    this.applications = const [],
    this.selectedAppId,
    this.selectedApplication,
    this.isDetailLoading = false,
    this.detailError,
    this.rotating,
    this.isSaving = false,
    this.isDeleting = false,
  });

  final bool isLoading;
  final String? error;
  final List<ApplicationResponse> applications;
  final String? selectedAppId;
  final ApplicationResponse? selectedApplication;
  final bool isDetailLoading;
  final String? detailError;
  final ApplicationsSecretKind? rotating;
  final bool isSaving;
  final bool isDeleting;

  bool get isDetailView => selectedAppId != null;

  ApplicationsViewState copyWith({
    bool? isLoading,
    String? Function()? error,
    List<ApplicationResponse>? applications,
    String? Function()? selectedAppId,
    ApplicationResponse? Function()? selectedApplication,
    bool? isDetailLoading,
    String? Function()? detailError,
    ApplicationsSecretKind? Function()? rotating,
    bool? isSaving,
    bool? isDeleting,
  }) {
    return ApplicationsViewState(
      isLoading: isLoading ?? this.isLoading,
      error: error != null ? error() : this.error,
      applications: applications ?? this.applications,
      selectedAppId: selectedAppId != null
          ? selectedAppId()
          : this.selectedAppId,
      selectedApplication: selectedApplication != null
          ? selectedApplication()
          : this.selectedApplication,
      isDetailLoading: isDetailLoading ?? this.isDetailLoading,
      detailError: detailError != null ? detailError() : this.detailError,
      rotating: rotating != null ? rotating() : this.rotating,
      isSaving: isSaving ?? this.isSaving,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }
}

@riverpod
class ApplicationsViewModel extends _$ApplicationsViewModel {
  @override
  ApplicationsViewState build() {
    unawaited(Future.microtask(load));
    return const ApplicationsViewState();
  }

  Future<void> load({bool silent = false}) async {
    if (!silent) {
      state = state.copyWith(isLoading: true, error: () => null);
    }
    try {
      final client = ref.read(fluxerClientProvider);
      final List<ApplicationResponse> apps = await client.oAuth2
          .listUserApplications();
      state = state.copyWith(
        isLoading: false,
        error: () => null,
        applications: apps,
        selectedApplication: () {
          final String? selectedId = state.selectedAppId;
          if (selectedId == null) {
            return state.selectedApplication;
          }
          for (final ApplicationResponse app in apps) {
            if (app.id == selectedId) {
              return _mergeListItem(state.selectedApplication, app);
            }
          }
          return state.selectedApplication;
        },
      );
    } on Object catch (e, st) {
      talker.error('Failed to load applications', e, st);
      state = state.copyWith(isLoading: false, error: () => 'failed');
    }
  }

  Future<void> openDetail(String appId, {ApplicationResponse? seed}) async {
    final ApplicationResponse? cached = seed ?? _appById(appId);
    state = state.copyWith(
      selectedAppId: () => appId,
      selectedApplication: () => cached,
      isDetailLoading: cached == null,
      detailError: () => null,
    );
    await _fetchDetail(appId, showLoading: cached == null);
    unawaited(load(silent: true));
  }

  void closeDetail() {
    state = state.copyWith(
      selectedAppId: () => null,
      selectedApplication: () => null,
      isDetailLoading: false,
      detailError: () => null,
      rotating: () => null,
    );
  }

  Future<ApplicationResponse?> create({required String name}) async {
    try {
      final client = ref.read(fluxerClientProvider);
      final ApplicationResponse created = await client.oAuth2
          .createOauthApplication(
            body: ApplicationCreateRequest(
              name: name,
              redirectUris: const <String>[],
            ),
          );
      await openDetail(created.id, seed: created);
      return created;
    } on Object catch (e, st) {
      talker.error('Failed to create application', e, st);
      rethrow;
    }
  }

  Future<bool> saveApplication(ApplicationUpdateRequest body) async {
    final String? appId = state.selectedAppId;
    if (appId == null) {
      return false;
    }
    state = state.copyWith(isSaving: true);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.oAuth2.updateOauthApplication(id: appId, body: body);
      await _fetchDetail(appId, showLoading: false);
      state = state.copyWith(isSaving: false);
      return true;
    } on Object catch (e, st) {
      talker.error('Failed to update application', e, st);
      state = state.copyWith(isSaving: false);
      rethrow;
    }
  }

  Future<bool> saveBotProfile({
    required BotProfileUpdateRequest body,
    bool clearAvatar = false,
    bool clearBanner = false,
  }) async {
    final String? appId = state.selectedAppId;
    if (appId == null) {
      return false;
    }
    state = state.copyWith(isSaving: true);
    try {
      if (clearAvatar || clearBanner) {
        final Map<String, dynamic> json = body.toJson();
        if (clearAvatar) {
          json['avatar'] = null;
        }
        if (clearBanner) {
          json['banner'] = null;
        }
        final dio = ref.read(fluxerDioProvider);
        await dio.patch<dynamic>('/oauth2/applications/$appId/bot', data: json);
      } else {
        final client = ref.read(fluxerClientProvider);
        await client.oAuth2.updateBotProfile(id: appId, body: body);
      }
      await _fetchDetail(appId, showLoading: false);
      state = state.copyWith(isSaving: false);
      return true;
    } on Object catch (e, st) {
      talker.error('Failed to update bot profile', e, st);
      state = state.copyWith(isSaving: false);
      rethrow;
    }
  }

  Future<bool> deleteSelected() async {
    final String? appId = state.selectedAppId;
    if (appId == null) {
      return false;
    }
    state = state.copyWith(isDeleting: true);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.oAuth2.deleteOauthApplication(
        id: appId,
        body: const SudoVerificationSchema(),
      );
      final List<ApplicationResponse> remaining = state.applications
          .where((app) => app.id != appId)
          .toList();
      state = state.copyWith(
        isDeleting: false,
        applications: remaining,
        selectedAppId: () => null,
        selectedApplication: () => null,
      );
      return true;
    } on Object catch (e, st) {
      talker.error('Failed to delete application', e, st);
      state = state.copyWith(isDeleting: false);
      rethrow;
    }
  }

  Future<bool> resetClientSecret() async {
    final String? appId = state.selectedAppId;
    if (appId == null) {
      return false;
    }
    state = state.copyWith(rotating: () => ApplicationsSecretKind.client);
    try {
      final client = ref.read(fluxerClientProvider);
      final ApplicationResponse updated = await client.oAuth2.resetClientSecret(
        id: appId,
        body: const SudoVerificationSchema(),
      );
      _replaceSelected(updated);
      state = state.copyWith(rotating: () => null);
      return true;
    } on Object catch (e, st) {
      talker.error('Failed to reset client secret', e, st);
      state = state.copyWith(rotating: () => null);
      rethrow;
    }
  }

  Future<bool> resetBotToken() async {
    final String? appId = state.selectedAppId;
    final ApplicationResponse? current = state.selectedApplication;
    if (appId == null || current == null) {
      return false;
    }
    state = state.copyWith(rotating: () => ApplicationsSecretKind.bot);
    try {
      final client = ref.read(fluxerClientProvider);
      final BotTokenResetResponse updated = await client.oAuth2.resetBotToken(
        id: appId,
        body: const SudoVerificationSchema(),
      );
      _replaceSelected(
        _copyApplicationResponse(
          current,
          bot: _copyApplicationBot(current.bot, token: updated.token),
        ),
      );
      state = state.copyWith(rotating: () => null);
      return true;
    } on Object catch (e, st) {
      talker.error('Failed to reset bot token', e, st);
      state = state.copyWith(rotating: () => null);
      rethrow;
    }
  }

  Future<void> _fetchDetail(String appId, {required bool showLoading}) async {
    if (showLoading) {
      state = state.copyWith(isDetailLoading: true, detailError: () => null);
    }
    try {
      final client = ref.read(fluxerClientProvider);
      final ApplicationResponse app = await client.oAuth2.getOauthApplication(
        id: appId,
      );
      if (state.selectedAppId != appId) {
        return;
      }
      _replaceSelected(app);
      state = state.copyWith(isDetailLoading: false, detailError: () => null);
    } on Object catch (e, st) {
      talker.error('Failed to load application details', e, st);
      if (state.selectedAppId != appId) {
        return;
      }
      state = state.copyWith(
        isDetailLoading: false,
        detailError: () => 'failed',
      );
    }
  }

  void _replaceSelected(ApplicationResponse app) {
    final List<ApplicationResponse> next = <ApplicationResponse>[];
    var found = false;
    for (final ApplicationResponse existing in state.applications) {
      if (existing.id == app.id) {
        next.add(app);
        found = true;
      } else {
        next.add(existing);
      }
    }
    if (!found) {
      next.add(app);
    }
    state = state.copyWith(applications: next, selectedApplication: () => app);
  }

  ApplicationResponse? _appById(String id) {
    for (final ApplicationResponse app in state.applications) {
      if (app.id == id) {
        return app;
      }
    }
    return null;
  }
}

ApplicationResponse _copyApplicationResponse(
  ApplicationResponse app, {
  ApplicationResponseBot? bot,
}) {
  return ApplicationResponse(
    id: app.id,
    name: app.name,
    redirectUris: app.redirectUris,
    botPublic: app.botPublic,
    botRequireCodeGrant: app.botRequireCodeGrant,
    clientSecret: app.clientSecret,
    bot: bot ?? app.bot,
  );
}

ApplicationResponseBot? _copyApplicationBot(
  ApplicationResponseBot? bot, {
  String? token,
}) {
  if (bot == null) {
    return null;
  }
  return ApplicationResponseBot(
    id: bot.id,
    username: bot.username,
    discriminator: bot.discriminator,
    bio: bot.bio,
    flags: bot.flags,
    avatar: bot.avatar,
    banner: bot.banner,
    token: token ?? bot.token,
    mfaEnabled: bot.mfaEnabled,
    authenticatorTypes: bot.authenticatorTypes,
  );
}

ApplicationResponse _mergeListItem(
  ApplicationResponse? detailed,
  ApplicationResponse listed,
) {
  if (detailed == null || detailed.id != listed.id) {
    return listed;
  }
  return ApplicationResponse(
    id: listed.id,
    name: listed.name,
    redirectUris: listed.redirectUris,
    botPublic: listed.botPublic,
    botRequireCodeGrant: listed.botRequireCodeGrant,
    clientSecret: detailed.clientSecret ?? listed.clientSecret,
    bot: _copyApplicationBot(
      listed.bot ?? detailed.bot,
      token: detailed.bot?.token ?? listed.bot?.token,
    ),
  );
}
