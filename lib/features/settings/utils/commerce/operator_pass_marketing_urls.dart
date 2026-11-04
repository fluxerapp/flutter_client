import 'package:fluxer_app/core/instance/instance_endpoints.dart';

Uri? operatorPassInfoUri({required bool selfHosted}) {
  if (selfHosted) {
    return null;
  }
  return Uri.parse('${InstanceEndpoints.marketing}/pass');
}

Uri? operatorPassTermsUri({required bool selfHosted}) {
  if (selfHosted) {
    return null;
  }
  return Uri.parse('${InstanceEndpoints.marketing}/operator-pass-terms');
}
