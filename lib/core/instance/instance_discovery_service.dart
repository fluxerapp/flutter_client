import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/instance/instance_compatibility.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';

enum InstanceDiscoveryFailureReason {
  invalidDiscoveryResponse,
  instanceOutdated,
  requiresNewerClient,
  insecureConnection,
}

class InstanceDiscoveryException implements Exception {
  const InstanceDiscoveryException(
    this.message, {
    this.reason,
    this.reportedApiCodeVersion,
    this.reportedCodename,
  });

  final String message;
  final InstanceDiscoveryFailureReason? reason;
  final int? reportedApiCodeVersion;
  final String? reportedCodename;

  @override
  String toString() => message;
}

class InstanceDiscoveryService {
  InstanceDiscoveryService({
    InstanceEndpointNormalizer? normalizer,
    Dio? dio,
    bool? rejectPublicCleartext,
  }) : _normalizer = normalizer ?? const InstanceEndpointNormalizer(),
       _rejectPublicCleartext =
           rejectPublicCleartext ?? defaultTargetPlatform == TargetPlatform.iOS,
       _dio =
           dio ??
           Dio(
             BaseOptions(
               connectTimeout: const Duration(seconds: 15),
               receiveTimeout: const Duration(seconds: 10),
               headers: const <String, dynamic>{'Accept': 'application/json'},
             ),
           );

  final InstanceEndpointNormalizer _normalizer;
  final Dio _dio;
  final bool _rejectPublicCleartext;

  void _assertSecureEndpoints(List<String> endpoints) {
    if (!_rejectPublicCleartext) {
      return;
    }
    if (endpoints.any(isPublicCleartextEndpoint)) {
      throw const InstanceDiscoveryException(
        'Instance does not use a secure connection',
        reason: InstanceDiscoveryFailureReason.insecureConnection,
      );
    }
  }

  Future<InstanceConfigSnapshot> connectToEndpoint(String input) async {
    if (_normalizer.isOfficialInstanceInput(input)) {
      return InstanceConfigSnapshot.officialDefault();
    }
    final String apiEndpoint = _normalizer.normalizeEndpoint(input);
    _assertSecureEndpoints(<String>[apiEndpoint]);
    final String wellKnownUrl = _normalizer.buildWellKnownUrl(apiEndpoint);
    talker.debug(
      '[InstanceDiscovery] Discovering instance input=$input '
      'apiEndpoint=$apiEndpoint wellKnownUrl=$wellKnownUrl',
    );
    try {
      final Response<dynamic> response = await _dio.get<dynamic>(wellKnownUrl);
      if (response.statusCode != 200 || response.data == null) {
        talker.warning(
          '[InstanceDiscovery] Non-success response from $wellKnownUrl '
          'status=${response.statusCode ?? 'unknown'}',
        );
        throw InstanceDiscoveryException(
          'Failed to reach $wellKnownUrl (${response.statusCode ?? 'unknown'})',
        );
      }
      final Object? data = response.data;
      if (data is! Map) {
        talker.warning(
          '[InstanceDiscovery] Expected JSON object from $wellKnownUrl, '
          'got ${data.runtimeType}: ${_describeResponseBody(data)}',
        );
        throw const InstanceDiscoveryException(
          'Invalid instance discovery response',
          reason: InstanceDiscoveryFailureReason.invalidDiscoveryResponse,
        );
      }
      final Map<String, dynamic> payload = Map<String, dynamic>.from(data);
      InstanceCompatibility.validateDiscoveryPayload(payload);
      final WellKnownFluxerResponse wellKnown;
      try {
        wellKnown = InstanceConfigSnapshot.parseWellKnown(payload);
      } on Object catch (error, stackTrace) {
        talker.error(
          '[InstanceDiscovery] Failed to parse well-known response from '
          '$wellKnownUrl body=${_describeResponseBody(payload)}',
          error,
          stackTrace,
        );
        throw const InstanceDiscoveryException(
          'Invalid instance discovery response',
          reason: InstanceDiscoveryFailureReason.invalidDiscoveryResponse,
        );
      }
      InstanceCompatibility.validateWellKnownDocument(wellKnown);
      final InstanceConfigSnapshot snapshot =
          InstanceConfigSnapshot.fromWellKnown(
            wellKnown: wellKnown,
            normalizer: _normalizer,
          );
      _assertSecureEndpoints(<String>[
        snapshot.apiBaseUrl,
        snapshot.gatewayUrl,
        snapshot.mediaBaseUrl,
      ]);
      talker.info(
        '[InstanceDiscovery] Connected to ${snapshot.displayDomain} '
        'api=${snapshot.apiBaseUrl}',
      );
      return snapshot;
    } on InstanceDiscoveryException {
      rethrow;
    } on DioException catch (error, stackTrace) {
      final int? statusCode = error.response?.statusCode;
      talker.warning(
        '[InstanceDiscovery] Request failed for $wellKnownUrl '
        'type=${error.type} status=${statusCode ?? 'unknown'} '
        'message=${error.message}',
        error,
        stackTrace,
      );
      throw InstanceDiscoveryException(
        'Failed to reach $wellKnownUrl (${statusCode ?? 'unknown'})',
      );
    }
  }

  static String _describeResponseBody(Object? data) {
    if (data == null) {
      return 'null';
    }
    final String text = data.toString();
    const int maxLength = 240;
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}…';
  }
}
