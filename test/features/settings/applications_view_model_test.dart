import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/settings/providers/applications_view_model.dart';
import 'package:fluxer_dart/export.dart';

class _FakeOAuth2Api implements OAuth2Api {
  _FakeOAuth2Api({List<ApplicationResponse>? apps, this.listError})
    : apps = apps ?? <ApplicationResponse>[];

  List<ApplicationResponse> apps;
  Object? listError;
  String? lastDeletedId;
  String? lastCreatedName;

  @override
  Future<List<ApplicationResponse>> listUserApplications() async {
    if (listError != null) {
      // ignore: only_throw_errors -- test helper rethrows arbitrary objects
      throw listError!;
    }
    return List<ApplicationResponse>.from(apps);
  }

  @override
  Future<ApplicationResponse> createOauthApplication({
    required ApplicationCreateRequest body,
  }) async {
    lastCreatedName = body.name;
    final ApplicationResponse created = _app(id: 'created-1', name: body.name);
    apps = [...apps, created];
    return created;
  }

  @override
  Future<ApplicationResponse> getOauthApplication({required String id}) async {
    return apps.firstWhere((app) => app.id == id);
  }

  @override
  Future<void> deleteOauthApplication({
    required String id,
    SudoVerificationSchema? body,
  }) async {
    lastDeletedId = id;
    apps = apps.where((app) => app.id != id).toList();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._oauth) : super(Dio());

  final OAuth2Api _oauth;

  @override
  OAuth2Api get oAuth2 => _oauth;
}

ApplicationResponse _app({required String id, required String name}) {
  return ApplicationResponse(
    id: id,
    name: name,
    redirectUris: const <String>[],
    botPublic: true,
    botRequireCodeGrant: false,
  );
}

ProviderContainer _container(OAuth2Api api) {
  return ProviderContainer(
    overrides: [fluxerClientProvider.overrideWithValue(_FakeClient(api))],
  );
}

Future<void> _settleLoad(ProviderContainer container) async {
  final sub = container.listen(applicationsViewModelProvider, (_, _) {});
  addTearDown(sub.close);
  await Future<void>.delayed(Duration.zero);
  await Future<void>.delayed(Duration.zero);
}

void main() {
  group('ApplicationsViewModel', () {
    test('load populates applications on success', () async {
      final api = _FakeOAuth2Api(
        apps: [
          _app(id: 'a', name: 'Alpha'),
          _app(id: 'b', name: 'Beta'),
        ],
      );
      final container = _container(api);
      addTearDown(container.dispose);

      await _settleLoad(container);

      final state = container.read(applicationsViewModelProvider);
      expect(state.isLoading, isFalse);
      expect(state.error, isNull);
      expect(state.applications.map((app) => app.id), ['a', 'b']);
    });

    test('load sets error on failure', () async {
      final api = _FakeOAuth2Api(
        listError: DioException(requestOptions: RequestOptions()),
      );
      final container = _container(api);
      addTearDown(container.dispose);

      await _settleLoad(container);

      final state = container.read(applicationsViewModelProvider);
      expect(state.isLoading, isFalse);
      expect(state.error, 'failed');
      expect(state.applications, isEmpty);
    });

    test('create opens detail for the new application', () async {
      final api = _FakeOAuth2Api();
      final container = _container(api);
      addTearDown(container.dispose);
      await _settleLoad(container);

      final ApplicationResponse? created = await container
          .read(applicationsViewModelProvider.notifier)
          .create(name: 'My bot');

      expect(created?.id, 'created-1');
      expect(api.lastCreatedName, 'My bot');
      final state = container.read(applicationsViewModelProvider);
      expect(state.selectedAppId, 'created-1');
      expect(state.selectedApplication?.name, 'My bot');
      expect(state.isDetailView, isTrue);
    });

    test('openDetail loads the selected application', () async {
      final api = _FakeOAuth2Api(
        apps: [_app(id: 'a', name: 'Alpha')],
      );
      final container = _container(api);
      addTearDown(container.dispose);
      await _settleLoad(container);

      await container
          .read(applicationsViewModelProvider.notifier)
          .openDetail('a');

      final state = container.read(applicationsViewModelProvider);
      expect(state.selectedAppId, 'a');
      expect(state.selectedApplication?.name, 'Alpha');
      expect(state.detailError, isNull);
    });

    test('deleteSelected removes the app and returns to the list', () async {
      final api = _FakeOAuth2Api(
        apps: [
          _app(id: 'a', name: 'Alpha'),
          _app(id: 'b', name: 'Beta'),
        ],
      );
      final container = _container(api);
      addTearDown(container.dispose);
      await _settleLoad(container);

      await container
          .read(applicationsViewModelProvider.notifier)
          .openDetail('a');
      final bool deleted = await container
          .read(applicationsViewModelProvider.notifier)
          .deleteSelected();

      expect(deleted, isTrue);
      expect(api.lastDeletedId, 'a');
      final state = container.read(applicationsViewModelProvider);
      expect(state.selectedAppId, isNull);
      expect(state.applications.map((app) => app.id), ['b']);
    });
  });
}
