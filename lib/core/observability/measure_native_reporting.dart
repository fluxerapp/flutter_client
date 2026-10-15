import 'package:flutter/services.dart';

const MethodChannel _measureReportingChannel = MethodChannel(
  'fluxer_app/measure_reporting',
);

Future<bool> initializeNativeMeasure() async {
  try {
    return await _measureReportingChannel.invokeMethod<bool>('initialize') ??
        false;
  } on MissingPluginException {
    return false;
  } on PlatformException {
    return false;
  }
}
