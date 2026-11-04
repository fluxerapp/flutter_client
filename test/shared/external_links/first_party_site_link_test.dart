import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/external_links/first_party_site_link.dart';

void main() {
  test('first-party site pages open in the app view', () {
    String open(String url) =>
        withFirstPartySiteAppView(Uri.parse(url)).toString();

    expect(
      open('https://fluxer.com/help/copyright'),
      'https://fluxer.com/help/copyright?view=app',
    );
    expect(
      open('https://fluxer.com/terms?x=1#a'),
      'https://fluxer.com/terms?x=1&view=app#a',
    );
    expect(
      open('https://fluxer.app/operator-pass-terms'),
      'https://fluxer.app/operator-pass-terms?view=app',
    );
    expect(
      open('https://fluxer.com/channels/@me'),
      'https://fluxer.com/channels/@me',
    );
    expect(
      open('https://fluxer.com/careers'),
      'https://fluxer.com/careers?view=app',
    );
    expect(
      open('https://fluxer.com/partners'),
      'https://fluxer.com/partners?view=app',
    );
    expect(open('https://fluxer.com/donate'), 'https://fluxer.com/donate');
    expect(
      open('https://chat.example.org/help'),
      'https://chat.example.org/help',
    );
  });
}
