import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/deep_links/app_page_links.dart';

void main() {
  group('appPageIdForPath', () {
    const AppPageLinkAvailability availability = AppPageLinkAvailability();

    test('recognises the Explore page path', () {
      expect(
        appPageIdForPath('/channels/@explore', availability: availability),
        AppPageId.discovery,
      );
    });

    test('recognises the legacy discover path', () {
      expect(
        appPageIdForPath('/channels/@discover', availability: availability),
        AppPageId.discovery,
      );
    });
  });
}
