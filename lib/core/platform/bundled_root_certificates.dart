import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/talker.dart';

const String bundledRootCertificatesAsset =
    'assets/certificates/root_certificates.pem';

Future<void> trustBundledRootCertificates({
  bool? isAndroid,
  AssetBundle? bundle,
  SecurityContext? context,
}) async {
  if (!(isAndroid ?? Platform.isAndroid)) {
    return;
  }
  try {
    final ByteData data = await (bundle ?? rootBundle).load(
      bundledRootCertificatesAsset,
    );
    (context ?? SecurityContext.defaultContext).setTrustedCertificatesBytes(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
  } on Object catch (error, stackTrace) {
    talker.error(
      'Could not trust the bundled root certificates',
      error,
      stackTrace,
    );
  }
}
