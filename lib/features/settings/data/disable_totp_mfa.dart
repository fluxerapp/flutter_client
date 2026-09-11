import 'package:dio/dio.dart';

/// Disables TOTP MFA with one authenticator or backup code.
///
/// Sudo and disable cannot share the same TOTP (90s replay lock), so sudo uses
/// [code] and disable uses an unused backup code.
Future<void> disableTotpMfa({required Dio dio, required String code}) async {
  final backupResponse = await dio.post<Map<String, dynamic>>(
    '/users/@me/mfa/backup-codes',
    data: <String, dynamic>{
      'regenerate': false,
      'mfa_method': 'totp',
      'mfa_code': code,
    },
  );
  var disableCode = firstUnusedMfaBackupCode(backupResponse.data);
  if (disableCode == null) {
    final regenerated = await dio.post<Map<String, dynamic>>(
      '/users/@me/mfa/backup-codes',
      data: <String, dynamic>{'regenerate': true},
    );
    disableCode = firstUnusedMfaBackupCode(regenerated.data);
  }
  if (disableCode == null) {
    throw DioException(
      requestOptions: backupResponse.requestOptions,
      response: backupResponse,
      type: DioExceptionType.badResponse,
      message: 'No unused MFA backup code available',
    );
  }
  await dio.post<void>(
    '/users/@me/mfa/totp/disable',
    data: <String, dynamic>{'code': disableCode},
  );
}

String? firstUnusedMfaBackupCode(Map<String, dynamic>? data) {
  final codes = data?['backup_codes'];
  if (codes is! List) {
    return null;
  }
  for (final item in codes) {
    if (item is! Map) {
      continue;
    }
    if (item['consumed'] == true) {
      continue;
    }
    final backupCode = item['code'];
    if (backupCode is String && backupCode.isNotEmpty) {
      return backupCode;
    }
  }
  return null;
}
