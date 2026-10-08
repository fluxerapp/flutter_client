enum RecoveryKitReason { created, replaced, recovered }

class RecoveryKit {
  const RecoveryKit({
    required this.recoveryKey,
    required this.createdAt,
    required this.reason,
    this.username,
    this.discriminator,
  });

  final String recoveryKey;
  final DateTime createdAt;
  final RecoveryKitReason reason;
  final String? username;
  final String? discriminator;
}

const String _recoveryKeyAlphabet = '0123456789ABCDEFGHJKMNPQRSTVWXYZ';
const int recoveryKeyLength = 32;
const int _recoveryKeyGroupSize = 4;
const String recoveryKeySeparator = '-';
const Map<String, String> _recoveryKeyAliases = <String, String>{
  'O': '0',
  'I': '1',
  'L': '1',
};
final RegExp _ignoredRecoveryKeyCharacters = RegExp(
  r'[\s‐-―−-]',
  unicode: true,
);

String formatRecoveryKey(String key) {
  final List<String> groups = <String>[];
  for (int index = 0; index < key.length; index += _recoveryKeyGroupSize) {
    final int end = index + _recoveryKeyGroupSize;
    groups.add(key.substring(index, end > key.length ? key.length : end));
  }
  return groups.join(recoveryKeySeparator);
}

String formatRecoveryKeyInput(String input) {
  final StringBuffer normalized = StringBuffer();
  for (final String character
      in input.replaceAll(_ignoredRecoveryKeyCharacters, '').split('')) {
    final String upper = character.toUpperCase();
    final String mapped = _recoveryKeyAliases[upper] ?? upper;
    if (mapped.length != 1 || !_recoveryKeyAlphabet.contains(mapped)) {
      continue;
    }
    normalized.write(mapped);
    if (normalized.length >= recoveryKeyLength) {
      break;
    }
  }
  return formatRecoveryKey(normalized.toString());
}

bool isCompleteRecoveryKey(String input) {
  return formatRecoveryKeyInput(
        input,
      ).replaceAll(recoveryKeySeparator, '').length ==
      recoveryKeyLength;
}

Uri buildRecoverAccountUrl({
  required String webAppBaseUrl,
  String? account,
  String? recoveryKey,
}) {
  final String base = webAppBaseUrl.endsWith('/')
      ? webAppBaseUrl.substring(0, webAppBaseUrl.length - 1)
      : webAppBaseUrl;
  final Uri page = Uri.parse('$base/recover');
  if (account == null || recoveryKey == null) {
    return page;
  }
  return page.replace(
    fragment:
        'username=${Uri.encodeComponent(account)}'
        '&key=${Uri.encodeComponent(recoveryKey)}',
  );
}
