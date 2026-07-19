import 'package:fluxer_app/core/platform/fluxer_platform.dart'
    show isFluxerDesktopOs, isFluxerMobileOs;

export 'package:fluxer_app/core/platform/fluxer_platform.dart'
    show isFluxerDesktopOs, isFluxerMobileOs;

bool get isDesktopOs => isFluxerDesktopOs;

bool get isMobileNative => isFluxerMobileOs;
