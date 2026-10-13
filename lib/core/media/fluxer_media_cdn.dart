import 'package:fluxer_app/core/instance/instance_endpoints.dart';

export 'package:fluxer_app/core/instance/instance_endpoints.dart'
    show InstanceEndpoints;

String get fluxerMediaCdn => InstanceEndpoints.media;

String get fluxerStaticCdn => InstanceEndpoints.staticCdn;
