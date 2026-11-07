import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
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

Future<bool> waitForSystemPromptAnswer({
  Duration grace = const Duration(seconds: 1),
}) async {
  final WidgetsBinding binding = WidgetsBinding.instance;
  bool interrupted = binding.lifecycleState != AppLifecycleState.resumed;
  final Completer<bool> answered = Completer<bool>();
  final AppLifecycleListener listener = AppLifecycleListener(
    binding: binding,
    onStateChange: (AppLifecycleState state) {
      if (state != AppLifecycleState.resumed) {
        interrupted = true;
      } else if (interrupted && !answered.isCompleted) {
        answered.complete(true);
      }
    },
  );
  final Timer graceTimer = Timer(grace, () {
    if (!interrupted && !answered.isCompleted) {
      answered.complete(false);
    }
  });
  try {
    return await answered.future;
  } finally {
    graceTimer.cancel();
    listener.dispose();
  }
}

class InstanceDiscoveryService {
  InstanceDiscoveryService({
    InstanceEndpointNormalizer? normalizer,
    Dio? dio,
    bool? rejectPublicCleartext,
    Future<bool> Function()? waitForLocalNetworkPrompt,
  }) : _normalizer = normalizer ?? const InstanceEndpointNormalizer(),
       _rejectPublicCleartext =
           rejectPublicCleartext ?? defaultTargetPlatform == TargetPlatform.iOS,
       _waitForLocalNetworkPrompt =
           waitForLocalNetworkPrompt ??
           (defaultTargetPlatform == TargetPlatform.iOS
               ? waitForSystemPromptAnswer
               : null),
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
  final Future<bool> Function()? _waitForLocalNetworkPrompt;

  Future<Response<dynamic>> _fetchWellKnown(String wellKnownUrl) async {
    try {
      return await _dio.get<dynamic>(wellKnownUrl);
    } on DioException catch (error) {
      final Future<bool> Function()? waitForPrompt = _waitForLocalNetworkPrompt;
      if (waitForPrompt == null ||
          error.type != DioExceptionType.connectionError ||
          !isLocalNetworkHost(Uri.parse(wellKnownUrl).host) ||
          !await waitForPrompt()) {
        rethrow;
      }
      talker.info(
        '[InstanceDiscovery] Retrying $wellKnownUrl after the local network '
        'prompt',
      );
      return _dio.get<dynamic>(wellKnownUrl);
    }
  }

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

  void _assertEndpointsBelongToInstance(
    InstanceConfigSnapshot snapshot, {
    required String enteredHost,
  }) {
    final String apiHost = Uri.tryParse(snapshot.apiBaseUrl)?.host ?? '';
    final String gatewayUrl = snapshot.gatewayUrl.trim();
    final bool officialApi = _normalizer.isOfficialInstanceInput(
      snapshot.apiBaseUrl,
    );
    if ((!officialApi && !isHostWithinInstance(apiHost, enteredHost)) ||
        (gatewayUrl.isNotEmpty &&
            !isGatewayTrustedForApi(gatewayUrl, snapshot.apiBaseUrl))) {
      talker.warning(
        '[InstanceDiscovery] Rejecting endpoints outside $enteredHost '
        'api=${snapshot.apiBaseUrl} gateway=$gatewayUrl',
      );
      throw const InstanceDiscoveryException(
        'Instance endpoints do not belong to the requested instance',
        reason: InstanceDiscoveryFailureReason.invalidDiscoveryResponse,
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
      final Response<dynamic> response = await _fetchWellKnown(wellKnownUrl);
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
      _assertEndpointsBelongToInstance(
        snapshot,
        enteredHost: Uri.parse(wellKnownUrl).host,
      );
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
