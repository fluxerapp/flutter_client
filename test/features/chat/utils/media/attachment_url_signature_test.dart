import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/features/chat/utils/media/attachment_url_signature.dart';

void main() {
  test('drops ex, is, hm and uc and keeps other query fields', () {
    expect(
      stripAttachmentSignature(
        'https://cdn.x/attachments/1/2/a.gif?ex=6a1b&is=69ff&hm=abc&size=96#f',
      ),
      'https://cdn.x/attachments/1/2/a.gif?size=96#f',
    );
  });

  test('removes the query entirely when only signature fields remain', () {
    expect(
      stripAttachmentSignature('https://cdn.x/a.gif?ex=1&is=2&hm=3&uc=dp'),
      'https://cdn.x/a.gif',
    );
  });

  test('leaves unsigned urls untouched', () {
    expect(
      stripAttachmentSignature('https://media.tenor.com/x.gif?w=1'),
      'https://media.tenor.com/x.gif?w=1',
    );
  });

  test('a signed attachment favourite is stored and matched unsigned', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final notifier = container.read(favoriteGifsProvider.notifier);
    const signed =
        'https://cdn.x/attachments/1/2/a.gif?ex=6a1b2c3d&is=69ff0000&hm=ab';
    notifier.addFromMessageMedia(url: signed, proxyUrl: signed);

    expect(
      container.read(favoriteGifsProvider).entries.single.url,
      'https://cdn.x/attachments/1/2/a.gif',
    );
    expect(
      notifier.hasUrl('https://cdn.x/attachments/1/2/a.gif?ex=1&is=2&hm=3'),
      isTrue,
    );

    notifier.addFromMessageMedia(
      url: 'https://cdn.x/attachments/1/2/a.gif',
      proxyUrl: 'https://cdn.x/attachments/1/2/a.gif',
    );
    expect(container.read(favoriteGifsProvider).entries, hasLength(1));

    notifier.removeByUrl(signed);
    expect(container.read(favoriteGifsProvider).entries, isEmpty);
  });
}
