import 'package:dio/dio.dart';
import 'package:fluxer_app/core/constants/external_urls.dart';
import 'package:fluxer_app/features/shell/domain/service_status_incident.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';

const Duration _kStatusRequestTimeout = Duration(seconds: 8);

const Map<String, String> _maintenanceStatusMap = <String, String>{
  'NOTSTARTEDYET': 'scheduled',
  'INPROGRESS': 'in_progress',
  'COMPLETED': 'completed',
};

class _NormalizedMaintenance {
  const _NormalizedMaintenance({
    required this.id,
    required this.name,
    required this.status,
    required this.start,
    required this.durationMinutes,
    required this.url,
  });

  final String id;
  final String name;
  final String status;
  final String start;
  final int durationMinutes;
  final String url;
}

int? _parseMaintenanceDurationMinutes(Object? duration) {
  if (duration == null) {
    return null;
  }
  if (duration is int) {
    return duration > 0 ? duration : null;
  }
  final int? parsed = int.tryParse(duration.toString());
  if (parsed == null || parsed <= 0) {
    return null;
  }
  return parsed;
}

String? _normalizeMaintenanceStatus(String status) {
  return _maintenanceStatusMap[status];
}

_NormalizedMaintenance? _normalizeMaintenance(Map<String, dynamic> m) {
  final String? status = _normalizeMaintenanceStatus(
    m['status'] as String? ?? '',
  );
  final String? start = m['start'] as String?;
  final String? id = m['id'] as String?;
  final String? name = m['name'] as String?;
  final String? url = m['url'] as String?;
  final int? durationMinutes = _parseMaintenanceDurationMinutes(m['duration']);
  if (status == null ||
      start == null ||
      start.isEmpty ||
      id == null ||
      name == null ||
      url == null ||
      durationMinutes == null) {
    return null;
  }
  return _NormalizedMaintenance(
    id: id,
    name: name,
    status: status,
    start: start,
    durationMinutes: durationMinutes,
    url: url,
  );
}

int _maintenanceStatusPriority(String status) {
  return switch (status) {
    'in_progress' => 0,
    'scheduled' => 1,
    'completed' => 2,
    _ => 99,
  };
}

_NormalizedMaintenance? _selectActiveMaintenance(List<dynamic>? maintenances) {
  _NormalizedMaintenance? selected;
  for (final Object? raw in maintenances ?? const <Object?>[]) {
    if (raw is! Map<String, dynamic>) {
      continue;
    }
    final _NormalizedMaintenance? normalized = _normalizeMaintenance(raw);
    if (normalized == null || normalized.status == 'completed') {
      continue;
    }
    if (selected == null ||
        _maintenanceStatusPriority(normalized.status) <
            _maintenanceStatusPriority(selected.status)) {
      selected = normalized;
    }
  }
  return selected;
}

ServiceStatusMaintenanceStatus _toMaintenanceStatus(String status) {
  return switch (status) {
    'in_progress' => ServiceStatusMaintenanceStatus.inProgress,
    'scheduled' => ServiceStatusMaintenanceStatus.scheduled,
    'completed' => ServiceStatusMaintenanceStatus.completed,
    _ => ServiceStatusMaintenanceStatus.scheduled,
  };
}

String _maintenanceStatusStorageKey(ServiceStatusMaintenanceStatus status) {
  return switch (status) {
    ServiceStatusMaintenanceStatus.inProgress => 'in_progress',
    ServiceStatusMaintenanceStatus.scheduled => 'scheduled',
    ServiceStatusMaintenanceStatus.completed => 'completed',
  };
}

ServiceStatusMaintenance? _mapMaintenance(_NormalizedMaintenance? maintenance) {
  if (maintenance == null) {
    return null;
  }
  final DateTime? start = DateTime.tryParse(maintenance.start);
  if (start == null) {
    return null;
  }
  return ServiceStatusMaintenance(
    id: maintenance.id,
    name: maintenance.name,
    status: _toMaintenanceStatus(maintenance.status),
    start: start.toUtc(),
    durationMinutes: maintenance.durationMinutes,
    url: maintenance.url,
  );
}

String maintenanceStatusStorageValue(ServiceStatusMaintenance maintenance) {
  return _maintenanceStatusStorageKey(maintenance.status);
}

bool _shouldFetchComponentMaintenances(
  Map<String, dynamic> data,
  _NormalizedMaintenance? activeMaintenance,
) {
  final Map<String, dynamic>? page = data['page'] as Map<String, dynamic>?;
  final String? pageStatus = page?['status'] as String?;
  return activeMaintenance == null && pageStatus == 'UNDERMAINTENANCE';
}

List<Map<String, dynamic>> _extractComponentMaintenances(Object? data) {
  if (data is List<dynamic>) {
    return data.whereType<Map<String, dynamic>>().expand((
      Map<String, dynamic> c,
    ) {
      final List<dynamic>? m = c['activeMaintenances'] as List<dynamic>?;
      return (m ?? const <dynamic>[]).whereType<Map<String, dynamic>>();
    }).toList();
  }
  if (data is Map<String, dynamic>) {
    final List<dynamic>? components = data['components'] as List<dynamic>?;
    return (components ?? const <dynamic>[])
        .whereType<Map<String, dynamic>>()
        .expand((Map<String, dynamic> c) {
          final List<dynamic>? m = c['activeMaintenances'] as List<dynamic>?;
          return (m ?? const <dynamic>[]).whereType<Map<String, dynamic>>();
        })
        .toList();
  }
  return <Map<String, dynamic>>[];
}

Dio _createStatusDio() {
  return Dio(
    BaseOptions(
      connectTimeout: _kStatusRequestTimeout,
      receiveTimeout: _kStatusRequestTimeout,
    ),
  );
}

/// Fetches Instatus summary (and optionally components)
class ServiceStatusClient {
  ServiceStatusClient({Dio? dio}) : _dio = dio ?? _createStatusDio();

  final Dio _dio;

  Future<ServiceStatusIncident?> fetchActiveIncident() async {
    try {
      final Response<dynamic> response = await _dio.get<dynamic>(
        '${ExternalUrls.serviceStatus}/summary.json',
      );
      if (response.statusCode != 200) {
        return null;
      }
      if (response.data is! Map<String, dynamic>) {
        return null;
      }
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      final List<dynamic>? incidents =
          data['activeIncidents'] as List<dynamic>?;
      Map<String, dynamic>? activeIncident;
      for (final Object? raw in incidents ?? const <Object?>[]) {
        if (raw is! Map<String, dynamic>) {
          continue;
        }
        final String status = raw['status'] as String? ?? '';
        final Object? resolved = raw['resolved'];
        if (status != 'RESOLVED' && resolved == null) {
          activeIncident = raw;
          break;
        }
      }
      _NormalizedMaintenance? activeMaintenance = _selectActiveMaintenance(
        data['activeMaintenances'] as List<dynamic>?,
      );
      if (_shouldFetchComponentMaintenances(data, activeMaintenance)) {
        activeMaintenance = _selectActiveMaintenance(
          await _fetchComponentMaintenancesList(),
        );
      }
      if (activeIncident != null) {
        final String id = activeIncident['id'] as String? ?? '';
        final String name = activeIncident['name'] as String? ?? '';
        final String url = activeIncident['url'] as String? ?? '';
        if (id.isEmpty || name.isEmpty || url.isEmpty) {
          return null;
        }
        return ServiceStatusIncident(id: id, name: name, url: url);
      }
      if (activeMaintenance?.status == 'in_progress') {
        return ServiceStatusIncident(
          id: activeMaintenance!.id,
          name: activeMaintenance.name,
          url: activeMaintenance.url,
        );
      }
      return null;
    } on DioException {
      return null;
    }
  }

  Future<ServiceStatusMaintenance?> fetchScheduledMaintenance() async {
    try {
      final Response<dynamic> response = await _dio.get<dynamic>(
        '${ExternalUrls.serviceStatus}/summary.json',
      );
      if (response.statusCode != 200 ||
          response.data is! Map<String, dynamic>) {
        return null;
      }
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      _NormalizedMaintenance? activeMaintenance = _selectActiveMaintenance(
        data['activeMaintenances'] as List<dynamic>?,
      );
      if (_shouldFetchComponentMaintenances(data, activeMaintenance)) {
        activeMaintenance = _selectActiveMaintenance(
          await _fetchComponentMaintenancesList(),
        );
      }
      return _mapMaintenance(activeMaintenance);
    } on DioException {
      return null;
    }
  }

  Future<List<dynamic>> _fetchComponentMaintenancesList() async {
    try {
      final Response<dynamic> response = await _dio.get<dynamic>(
        '${ExternalUrls.serviceStatus}/components.json',
      );
      if (response.statusCode != 200) {
        return <dynamic>[];
      }
      return _extractComponentMaintenances(response.data).cast<dynamic>();
    } on DioException {
      return <dynamic>[];
    }
  }
}
