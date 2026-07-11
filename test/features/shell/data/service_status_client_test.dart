import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/data/service_status_client.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';

void main() {
  group('ServiceStatusClient.fetchScheduledMaintenance', () {
    test(
      'selects in-progress maintenance over scheduled maintenance',
      () async {
        final ServiceStatusClient client = ServiceStatusClient(
          dio: _mockDio(<String, dynamic>{
            'activeMaintenances': <Map<String, dynamic>>[
              <String, dynamic>{
                'id': 'scheduled-1',
                'name': 'Scheduled',
                'status': 'NOTSTARTEDYET',
                'start': '2026-07-12T10:00:00.000Z',
                'duration': 60,
                'url': 'https://status.example/scheduled',
              },
              <String, dynamic>{
                'id': 'active-1',
                'name': 'In progress',
                'status': 'INPROGRESS',
                'start': '2026-07-11T10:00:00.000Z',
                'duration': 30,
                'url': 'https://status.example/active',
              },
            ],
          }),
        );

        final ServiceStatusMaintenance? maintenance = await client
            .fetchScheduledMaintenance();

        expect(maintenance?.id, 'active-1');
        expect(maintenance?.status, ServiceStatusMaintenanceStatus.inProgress);
      },
    );

    test(
      'falls back to component maintenances when page is under maintenance',
      () async {
        final Dio dio = Dio()
          ..httpClientAdapter = _StatusAdapter(
            summary: <String, dynamic>{
              'page': <String, dynamic>{'status': 'UNDERMAINTENANCE'},
              'activeMaintenances': <dynamic>[],
            },
            components: <Map<String, dynamic>>[
              <String, dynamic>{
                'activeMaintenances': <Map<String, dynamic>>[
                  <String, dynamic>{
                    'id': 'component-1',
                    'name': 'Component maintenance',
                    'status': 'INPROGRESS',
                    'start': '2026-07-11T12:00:00.000Z',
                    'duration': 45,
                    'url': 'https://status.example/component',
                  },
                ],
              },
            ],
          );

        final ServiceStatusClient client = ServiceStatusClient(dio: dio);
        final ServiceStatusMaintenance? maintenance = await client
            .fetchScheduledMaintenance();

        expect(maintenance?.id, 'component-1');
        expect(maintenance?.status, ServiceStatusMaintenanceStatus.inProgress);
      },
    );
  });
}

Dio _mockDio(Map<String, dynamic> summary) {
  return Dio()..httpClientAdapter = _SingleResponseAdapter(summary);
}

class _SingleResponseAdapter implements HttpClientAdapter {
  _SingleResponseAdapter(this._summary);

  final Map<String, dynamic> _summary;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromString(
      jsonEncode(_summary),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }
}

class _StatusAdapter implements HttpClientAdapter {
  _StatusAdapter({required this.summary, required this.components});

  final Map<String, dynamic> summary;
  final List<Map<String, dynamic>> components;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final String path = options.uri.path;
    final Map<String, dynamic> payload = path.endsWith('components.json')
        ? <String, dynamic>{'components': components}
        : summary;
    return ResponseBody.fromString(
      jsonEncode(payload),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }
}
