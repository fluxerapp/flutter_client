import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage createFluxerSecureStorage() {
  return const FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    mOptions: MacOsOptions(accessibility: KeychainAccessibility.first_unlock),
  );
}

bool _isTransientKeystoreFailure(PlatformException error) {
  final String blob = '${error.message ?? ''} ${error.details ?? ''}'
      .toLowerCase();
  return blob.contains('failed to generate key pair') ||
      blob.contains('secure_hw_communication_failed') ||
      blob.contains('keystore operation failed') ||
      blob.contains('failed to initialize storage cipher');
}

Future<T> runFluxerSecureStorage<T>(Future<T> Function() action) async {
  const List<Duration> backoff = <Duration>[
    Duration.zero,
    Duration(seconds: 2),
    Duration(seconds: 5),
  ];
  PlatformException? lastError;
  for (final Duration delay in backoff) {
    if (delay > Duration.zero) {
      await Future<void>.delayed(delay);
    }
    try {
      return await action();
    } on PlatformException catch (error) {
      lastError = error;
      if (!_isTransientKeystoreFailure(error)) {
        rethrow;
      }
    }
  }
  throw lastError!;
}
