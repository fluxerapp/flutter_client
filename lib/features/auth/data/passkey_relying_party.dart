import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:passkeys/exceptions.dart';

const String kPasskeyMigrationRpId = 'fluxer.com';

String? preferredPasskeyRpId(String apiBaseUrl) {
  return const InstanceEndpointNormalizer().isOfficialInstanceInput(apiBaseUrl)
      ? kPasskeyMigrationRpId
      : null;
}

Future<T> withPasskeyRelyingParty<T>({
  required String apiBaseUrl,
  required Future<T> Function(String? rpId) attempt,
}) async {
  final String? rpId = preferredPasskeyRpId(apiBaseUrl);
  if (rpId == null) {
    return attempt(null);
  }
  try {
    return await attempt(rpId);
  } on NoCredentialsAvailableException {
    return attempt(null);
  }
}
