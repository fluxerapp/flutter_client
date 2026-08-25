import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_media_grid.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_rich.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/forwarded_message_content.dart';
import 'package:fluxer_app/features/chat/utils/embed_gallery_utils.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

import '../../../../../helpers/test_l10n.dart';

const String _postUrl = 'https://example.com/post/1';

EmbedMedia _media(String name) => EmbedMedia(
  url: 'https://cdn.example/$name',
  proxyUrl: 'https://cdn.example/$name',
  width: 400,
  height: 300,
);

List<Embed> _galleryEmbedList() => <Embed>[
  Embed(
    type: EmbedType.link,
    url: _postUrl,
    title: 'Gallery post',
    thumbnail: _media('1.png'),
  ),
  Embed(type: EmbedType.rich, url: _postUrl, image: _media('2.png')),
  Embed(type: EmbedType.rich, url: _postUrl, image: _media('3.png')),
];

void main() {
  testWidgets('EmbedLink renders gallery grid for same-url embed images', (
    tester,
  ) async {
    final EmbedGalleryIndex galleryIndex = EmbedGalleryIndex(
      _galleryEmbedList(),
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: EmbedLink(
          embed: _galleryEmbedList().first,
          galleryIndex: galleryIndex,
          embedIndex: 0,
        ),
      ),
    );

    expect(find.byType(AttachmentMediaGrid), findsOneWidget);
  });

  testWidgets('EmbedRich renders gallery grid for same-url embed images', (
    tester,
  ) async {
    final List<Embed> embedList = <Embed>[
      Embed(
        type: EmbedType.rich,
        url: _postUrl,
        title: 'Rich gallery',
        image: _media('1.png'),
      ),
      Embed(type: EmbedType.rich, url: _postUrl, image: _media('2.png')),
    ];
    final EmbedGalleryIndex galleryIndex = EmbedGalleryIndex(embedList);
    await tester.pumpWidget(
      _buildTestApp(
        child: EmbedRich(
          embed: embedList.first,
          galleryIndex: galleryIndex,
          embedIndex: 0,
        ),
      ),
    );

    expect(find.byType(AttachmentMediaGrid), findsOneWidget);
  });

  testWidgets('forwarded snapshot groups same-url gallery embeds', (
    tester,
  ) async {
    final MessageSnapshot snapshot = MessageSnapshot(
      timestamp: DateTime(2026, 5, 9),
      embeds: _galleryEmbedList(),
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: ForwardedMessageContent(
          message: Message(
            id: 'message-1',
            channelId: 'channel-1',
            authorId: 'user-1',
            authorName: 'User',
            content: '',
            timestamp: DateTime(2026, 5, 9),
          ),
          snapshot: snapshot,
          renderEmbeds: true,
          inlineAttachmentMedia: true,
          revealSpoilers: false,
          chatPreferences: const ChatPreferencesState(),
          spoilerSyncController: FluxerSpoilerSyncController(),
        ),
      ),
    );

    expect(find.byType(AttachmentMediaGrid), findsOneWidget);
    expect(find.byType(EmbedLink), findsOneWidget);
    expect(find.byType(EmbedRich), findsNothing);
  });
}

Widget _buildTestApp({required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: SingleChildScrollView(child: child)),
    ),
  );
}
