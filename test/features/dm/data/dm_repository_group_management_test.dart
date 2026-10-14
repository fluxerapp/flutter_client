import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

class _FakeInvitesApi implements InvitesApi {
  ChannelInviteCreateRequest? lastBody;
  String? lastChannelId;

  @override
  Future<InviteMetadataResponseSchema> createChannelInvite({
    required SnowflakeType channelId,
    ChannelInviteCreateRequest? body,
  }) async {
    lastChannelId = channelId;
    lastBody = body;
    final InviteMetadataResponseSchemaGroupDmInviteMetadataResponse group =
        InviteMetadataResponseSchemaGroupDmInviteMetadataResponse(
          code: 'invite-code',
          type: 1,
          channel: const ChannelPartialResponse(
            id: 'group-1',
            type: ChannelType.groupDm,
          ),
          memberCount: 3,
          temporary: false,
          createdAt: DateTime.utc(2026),
          uses: 0,
          maxUses: 0,
        );
    return InviteMetadataResponseSchema(group.toJson());
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._invitesApi) : super(Dio());

  final InvitesApi _invitesApi;

  @override
  InvitesApi get invites => _invitesApi;
}

ProviderContainer _createContainer(Dio dio) {
  final db = openTestDatabase();
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      fluxerClientProvider.overrideWithValue(FluxerClient(dio)),
    ],
  );
}

DmRepository _createRepository(Dio dio) {
  final container = _createContainer(dio);
  return DmRepository(
    container.read(fluxerClientProvider),
    container.read(fluxerDatabaseProvider),
    container.read(guildUserSettingsRepositoryProvider),
  );
}

DmRepository _createRepositoryWithClient(FluxerClient client) {
  final db = openTestDatabase();
  final container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      fluxerClientProvider.overrideWithValue(client),
    ],
  );
  return DmRepository(
    container.read(fluxerClientProvider),
    container.read(fluxerDatabaseProvider),
    container.read(guildUserSettingsRepositoryProvider),
  );
}

void main() {
  group('group DM management repository methods', () {
    test('updateGroupDm sends PATCH with group DM type', () async {
      RequestOptions? captured;
      final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
                captured = options;
                handler.resolve(
                  Response<Map<String, dynamic>>(
                    requestOptions: options,
                    data: <String, dynamic>{
                      'id': 'group-1',
                      'type': 3,
                      'name': 'Renamed',
                      'recipients': <Map<String, dynamic>>[],
                    },
                  ),
                );
              },
        ),
      );

      final DmRepository repo = _createRepository(dio);
      await repo.updateGroupDm(channelId: 'group-1', name: 'Renamed');

      expect(captured?.method, 'PATCH');
      expect(captured?.path, endsWith('/channels/group-1'));
      expect(captured?.data, isA<Map<String, dynamic>>());
      final Map<String, dynamic> body = captured!.data as Map<String, dynamic>;
      expect(body['name'], 'Renamed');
    });

    test('updateGroupDm clears name and icon with explicit nulls', () async {
      RequestOptions? captured;
      final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
                captured = options;
                handler.resolve(
                  Response<Map<String, dynamic>>(
                    requestOptions: options,
                    data: <String, dynamic>{
                      'id': 'group-1',
                      'type': 3,
                      'name': null,
                      'icon': null,
                      'owner_id': 'user-1',
                      'recipients': <Map<String, dynamic>>[],
                    },
                  ),
                );
              },
        ),
      );

      final FluxerDatabase database = openTestDatabase();
      await database.dmChannelDao.upsertDmChannels(<DmChannelsCompanion>[
        DmChannelsCompanion.insert(
          id: 'group-1',
          recipientId: 'user-1',
          type: const Value<int>(3),
          name: const Value<String?>('Old name'),
          icon: const Value<String?>('old-icon'),
        ),
      ]);
      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(database),
          fluxerClientProvider.overrideWithValue(FluxerClient(dio)),
        ],
      );
      final DmRepository repo = DmRepository(
        container.read(fluxerClientProvider),
        database,
        container.read(guildUserSettingsRepositoryProvider),
      );
      await repo.updateGroupDm(
        channelId: 'group-1',
        name: null,
        removeIcon: true,
      );

      final Map<String, dynamic> body = captured!.data as Map<String, dynamic>;
      expect(body.containsKey('name'), isTrue);
      expect(body['name'], isNull);
      expect(body.containsKey('icon'), isTrue);
      expect(body['icon'], isNull);
      final DmChannel? row = await database.dmChannelDao.getDmChannelById(
        'group-1',
      );
      expect(row?.name, isNull);
      expect(row?.icon, isNull);
    });

    test('updateGroupDm leaves the icon out when it is unchanged', () async {
      RequestOptions? captured;
      final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
                captured = options;
                handler.resolve(
                  Response<Map<String, dynamic>>(
                    requestOptions: options,
                    data: <String, dynamic>{
                      'id': 'group-1',
                      'type': 3,
                      'name': 'Renamed',
                      'icon': 'abc',
                      'owner_id': 'user-1',
                      'recipients': <Map<String, dynamic>>[],
                    },
                  ),
                );
              },
        ),
      );

      final DmRepository repo = _createRepository(dio);
      await repo.updateGroupDm(channelId: 'group-1', name: 'Renamed');

      final Map<String, dynamic> body = captured!.data as Map<String, dynamic>;
      expect(body['name'], 'Renamed');
      expect(body.containsKey('icon'), isFalse);
    });

    test('addGroupDmMember sends PUT recipient request', () async {
      RequestOptions? captured;
      final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
                captured = options;
                handler.resolve(Response<void>(requestOptions: options));
              },
        ),
      );

      final DmRepository repo = _createRepository(dio);
      await repo.addGroupDmMember(channelId: 'group-1', userId: 'user-2');

      expect(captured?.method, 'PUT');
      expect(captured?.path, endsWith('/channels/group-1/recipients/user-2'));
    });

    test('removeGroupDmMember sends DELETE recipient request', () async {
      RequestOptions? captured;
      final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
                captured = options;
                handler.resolve(Response<void>(requestOptions: options));
              },
        ),
      );

      final DmRepository repo = _createRepository(dio);
      await repo.removeGroupDmMember(channelId: 'group-1', userId: 'user-2');

      expect(captured?.method, 'DELETE');
      expect(captured?.path, endsWith('/channels/group-1/recipients/user-2'));
    });

    test('createGroupDmInvite requests 24 hour invite', () async {
      final _FakeInvitesApi invitesApi = _FakeInvitesApi();
      final DmRepository repo = _createRepositoryWithClient(
        _FakeClient(invitesApi),
      );

      final String code = await repo.createGroupDmInvite(channelId: 'group-1');

      expect(code, 'invite-code');
      expect(invitesApi.lastChannelId, 'group-1');
      expect(invitesApi.lastBody?.maxAge, 86400);
      expect(invitesApi.lastBody?.maxUses, 0);
      expect(invitesApi.lastBody?.temporary, isFalse);
    });
  });
}
