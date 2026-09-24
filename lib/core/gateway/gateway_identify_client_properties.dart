import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_dart/gateway.dart';

GatewayIdentifyProperties buildGatewayIdentifyProperties(
  FluxerClientProperties properties,
) {
  final bool isDesktop = isFluxerDesktopOs;
  final String? buildVersion =
      properties.clientVersion ?? properties.buildNumber?.toString();
  return GatewayIdentifyProperties(
    os: properties.os,
    browser: properties.browser,
    device: properties.device,
    osVersion: properties.osVersion,
    locale: properties.locale,
    systemLocale: properties.systemLocale,
    browserVersion: properties.browserVersion,
    buildTimestamp: properties.buildTimestamp,
    buildVersion: buildVersion,
    userAgent: properties.userAgent,
    releaseChannel: properties.releaseChannel,
    clientPlatform: properties.clientPlatform,
    clientRuntime: properties.clientRuntime,
    desktopAppVersion:
        properties.desktopAppVersion ?? (isDesktop ? buildVersion : null),
    desktopAppChannel:
        properties.desktopAppChannel ??
        (isDesktop ? properties.releaseChannel : null),
    desktopArch: properties.desktopArch ?? properties.architecture,
    desktopOs: properties.desktopOs ?? (isDesktop ? properties.os : null),
    e2eeCapable: true,
    mobile: isFluxerMobileOs,
  );
}
