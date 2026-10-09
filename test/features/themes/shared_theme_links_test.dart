import 'package:fluxer_app/features/themes/utils/shared_theme_links.dart';
import 'package:test/test.dart';

void main() {
  test('matches theme links on a self-hosted web app', () {
    expect(
      findSharedThemeIds(
        'try https://chat.example.com/theme/neon or https://web.fluxer.app/theme/coal2',
        webAppBaseUrl: 'https://chat.example.com',
      ),
      <String>['neon', 'coal2'],
    );
  });
}
