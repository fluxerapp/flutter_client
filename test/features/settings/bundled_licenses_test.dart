import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/bundled_licenses.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('every bundled iOS licence asset loads with text', () async {
    for (final BundledLicense license in bundledLicenses(TargetPlatform.iOS)) {
      final String text = await rootBundle.loadString(license.asset);
      expect(text.trim(), isNotEmpty, reason: license.asset);
    }
  });
}
