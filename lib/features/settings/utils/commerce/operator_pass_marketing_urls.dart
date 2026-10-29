import 'package:fluxer_app/core/instance/instance_endpoints.dart';

String _marketingBase() {
  return InstanceEndpoints.invite.replaceAll(RegExp(r'/+$'), '');
}

Uri? operatorPassInfoUri({required bool selfHosted}) {
  if (selfHosted) {
    return null;
  }
  return Uri.parse('${_marketingBase()}/pass');
}

Uri? operatorPassTermsUri({required bool selfHosted}) {
  if (selfHosted) {
    return null;
  }
  return Uri.parse('${_marketingBase()}/operator-pass-terms');
}
