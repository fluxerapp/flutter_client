import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

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
      final Object? requestType = body['type'];
      expect(
        requestType == 3 ||
            requestType == GroupDmChannelUpdateRequestTypeType.groupDm,
        isTrue,
      );
      expect(body['name'], 'Renamed');
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

    test('createGroupDmInvite requests 24 hour invite', () async {
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
                      'type': 1,
                      'code': 'invite-code',
                      'channel': <String, dynamic>{'id': 'group-1', 'type': 3},
                      'member_count': 3,
                      'uses': 0,
                      'max_uses': 0,
                      'max_age': 86400,
                      'temporary': false,
                      'created_at': '2026-01-01T00:00:00.000Z',
                    },
                  ),
                );
              },
        ),
      );

      final DmRepository repo = _createRepository(dio);
      final String code = await repo.createGroupDmInvite(channelId: 'group-1');

      expect(code, 'invite-code');
      expect(captured?.method, 'POST');
      expect(captured?.path, endsWith('/channels/group-1/invites'));
      final Map<String, dynamic> body = captured!.data as Map<String, dynamic>;
      expect(body['max_age'], 86400);
    });
  });
}
