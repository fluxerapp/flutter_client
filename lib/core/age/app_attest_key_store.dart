import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/platform/fluxer_secure_storage.dart';

class AppAttestKeyRecord {
  const AppAttestKeyRecord({
    required this.keyId,
    required this.registered,
    this.submittedReport,
    this.submittedAt,
  });

  final String keyId;
  final bool registered;
  final DeclaredAgeReport? submittedReport;
  final DateTime? submittedAt;

  bool isFresh(DeclaredAgeReport report, DateTime now, Duration interval) {
    final DateTime? at = submittedAt;
    return registered &&
        submittedReport == report &&
        at != null &&
        now.difference(at) < interval;
  }
}

class AppAttestKeyStore {
  AppAttestKeyStore({FlutterSecureStorage? storage})
    : _storage = storage ?? createFluxerSecureStorage();

  final FlutterSecureStorage _storage;

  static String storageKey({
    required String bundleId,
    required String apiBaseUrl,
    required String userId,
  }) {
    return 'app_attest_key_${bundleId}_${apiBaseUrl}_$userId';
  }

  Future<AppAttestKeyRecord?> read(String key) async {
    final String? raw = await runFluxerSecureStorage(
      () => _storage.read(key: key),
    );
    if (raw == null) {
      return null;
    }
    try {
      final Object? decoded = jsonDecode(raw);
      if (decoded is! Map<String, Object?>) {
        return null;
      }
      final Object? keyId = decoded['key_id'];
      if (keyId is! String || keyId.isEmpty) {
        return null;
      }
      final Object? report = decoded['submitted_report'];
      final Object? at = decoded['submitted_at'];
      return AppAttestKeyRecord(
        keyId: keyId,
        registered: decoded['registered'] == true,
        submittedReport: report is String
            ? DeclaredAgeReport.values.asNameMap()[report]
            : null,
        submittedAt: at is String ? DateTime.tryParse(at) : null,
      );
    } on FormatException {
      return null;
    }
  }

  Future<void> write(String key, AppAttestKeyRecord record) {
    return runFluxerSecureStorage(
      () => _storage.write(
        key: key,
        value: jsonEncode(<String, Object>{
          'key_id': record.keyId,
          'registered': record.registered,
          if (record.submittedReport != null)
            'submitted_report': record.submittedReport!.name,
          if (record.submittedAt != null)
            'submitted_at': record.submittedAt!.toUtc().toIso8601String(),
        }),
      ),
    );
  }

  Future<void> delete(String key) {
    return runFluxerSecureStorage(() => _storage.delete(key: key));
  }
}
