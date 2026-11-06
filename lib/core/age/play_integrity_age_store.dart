import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluxer_app/core/platform/fluxer_secure_storage.dart';

class PlayAgeRange {
  const PlayAgeRange({
    required this.lower,
    required this.upper,
    required this.source,
  });

  final int lower;
  final int? upper;
  final String source;

  static PlayAgeRange? fromPayload(Map<Object?, Object?>? payload) {
    if (payload == null || payload['status'] != 'sharing') {
      return null;
    }
    final Object? lower = payload['lowerBound'];
    final Object? upper = payload['upperBound'];
    final Object? source = payload['ageRangeSource'];
    if (lower is! int || source is! String || source.isEmpty) {
      return null;
    }
    return PlayAgeRange(
      lower: lower,
      upper: upper is int ? upper : null,
      source: source,
    );
  }

  String get signature => '$lower|${upper ?? ''}|$source';
}

enum PlayIntegrityAgeOutcome { submitted, appNotRecognized, deviceNotTrusted }

class PlayIntegrityAgeRecord {
  const PlayIntegrityAgeRecord({
    required this.rangeSignature,
    required this.outcome,
    required this.at,
  });

  final String rangeSignature;
  final PlayIntegrityAgeOutcome outcome;
  final DateTime at;

  bool isFresh(PlayAgeRange range, DateTime now, Duration interval) {
    return rangeSignature == range.signature && now.difference(at) < interval;
  }
}

class PlayIntegrityAgeStore {
  PlayIntegrityAgeStore({FlutterSecureStorage? storage})
    : _storage = storage ?? createFluxerSecureStorage();

  final FlutterSecureStorage _storage;

  static String storageKey({
    required String packageName,
    required String apiBaseUrl,
    required String userId,
  }) {
    return 'play_integrity_age_${packageName}_${apiBaseUrl}_$userId';
  }

  Future<PlayIntegrityAgeRecord?> read(String key) async {
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
      final Object? range = decoded['range'];
      final Object? outcome = decoded['outcome'];
      final Object? at = decoded['at'];
      final PlayIntegrityAgeOutcome? parsedOutcome = outcome is String
          ? PlayIntegrityAgeOutcome.values.asNameMap()[outcome]
          : null;
      final DateTime? parsedAt = at is String ? DateTime.tryParse(at) : null;
      if (range is! String || parsedOutcome == null || parsedAt == null) {
        return null;
      }
      return PlayIntegrityAgeRecord(
        rangeSignature: range,
        outcome: parsedOutcome,
        at: parsedAt,
      );
    } on FormatException {
      return null;
    }
  }

  Future<void> write(String key, PlayIntegrityAgeRecord record) {
    return runFluxerSecureStorage(
      () => _storage.write(
        key: key,
        value: jsonEncode(<String, String>{
          'range': record.rangeSignature,
          'outcome': record.outcome.name,
          'at': record.at.toUtc().toIso8601String(),
        }),
      ),
    );
  }
}
