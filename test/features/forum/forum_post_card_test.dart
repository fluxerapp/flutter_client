import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_post_card.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_tag_chip.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart' show ForumTagResponse;

import '../../helpers/test_l10n.dart';

Widget _app(Widget child, {required double width, double? height}) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(
      body: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(width: width, height: height, child: child),
      ),
    ),
  );
}

const Channel _forum = Channel(
  id: '100',
  guildId: 'g1',
  name: 'feedback',
  type: ChannelType.guildForum,
  defaultReactionEmojiJson: '{"emoji_id":null,"emoji_name":"👍"}',
);

ForumPostCardData _data({int unreadCount = 4, bool thumbnail = false}) {
  final DateTime twoDaysAgo = DateTime.now().subtract(
    const Duration(days: 2, hours: 1),
  );
  final String postId = snowflakeFromDateTime(
    twoDaysAgo.subtract(const Duration(days: 1)),
  );
  return ForumPostCardData(
    forum: _forum,
    post: Channel(
      id: postId,
      guildId: 'g1',
      name: 'What should the next community event be about',
      type: ChannelType.publicThread,
      parentId: '100',
      messageCount: 1234,
    ),
    lastMessageId: snowflakeFromDateTime(twoDaysAgo),
    firstMessageLoaded: true,
    firstMessage: Message(
      id: postId,
      channelId: postId,
      authorId: '200',
      authorName: 'Robin',
      content:
          'We could run a build night, a quiz or a long playtest. Reply '
          'with the one you would join and when you are free.',
      timestamp: twoDaysAgo,
      reactions: const <Reaction>[Reaction(emoji: '👍', count: 17)],
      attachments: thumbnail
          ? const <Attachment>[
              Attachment(
                id: '300',
                filename: 'photo.png',
                url: 'https://media.invalid/photo.png',
                proxyUrl: 'https://media.invalid/attachments/100/300/photo.png',
                contentType: 'image/png',
                width: 800,
                height: 600,
              ),
            ]
          : const <Attachment>[],
    ),
    unreadCount: unreadCount,
    hasUnread: unreadCount > 0,
  );
}

const Attachment _photo = Attachment(
  id: '300',
  filename: 'photo.png',
  url: 'https://media.invalid/photo.png',
  contentType: 'image/png',
  width: 800,
  height: 600,
);

const Attachment _spoiler = Attachment(
  id: '301',
  filename: 'spoiler.png',
  url: 'https://media.invalid/spoiler.png',
  contentType: 'image/png',
  width: 800,
  height: 600,
  flags: attachmentFlagIsSpoiler,
);

ForumPostCardData _withAttachments(List<Attachment> attachments) {
  final ForumPostCardData base = _data();
  final Message first = base.firstMessage!;
  return ForumPostCardData(
    forum: base.forum,
    post: base.post,
    lastMessageId: base.lastMessageId,
    firstMessageLoaded: true,
    firstMessage: Message(
      id: first.id,
      channelId: first.channelId,
      authorId: first.authorId,
      authorName: first.authorName,
      content: first.content,
      timestamp: first.timestamp,
      attachments: attachments,
    ),
  );
}

Offset _previewPoint(WidgetTester tester) =>
    tester.getRect(find.byType(ForumPostTile)).topCenter + const Offset(0, 40);

Finder _footerText(String text) => find.descendant(
  of: find.byKey(const ValueKey<String>('forumPostFooter')),
  matching: find.text(text),
);

void _expectNoClippedText(WidgetTester tester) {
  for (final RenderParagraph paragraph in tester.renderObjectList(
    find.descendant(
      of: find.byKey(const ValueKey<String>('forumPostFooter')),
      matching: find.byType(RichText),
    ),
  )) {
    expect(paragraph.didExceedMaxLines, isFalse);
    expect(
      paragraph.size.width,
      greaterThanOrEqualTo(paragraph.getMaxIntrinsicWidth(double.infinity)),
    );
  }
}

void _expectOneLine(WidgetTester tester, List<String> texts) {
  final double centre = tester.getCenter(_footerText(texts.first)).dy;
  for (final String text in texts) {
    expect(tester.getCenter(_footerText(text)).dy, closeTo(centre, 1));
  }
}

void main() {
  testWidgets('a 390 pt list card keeps every footer part on one line', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      _app(
        ForumPostCard(
          data: _data(),
          onTap: () {},
          showReaction: true,
          onToggleReaction: () {},
        ),
        width: 390,
      ),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(_footerText('17'), findsOneWidget);
    expect(_footerText('1.2K'), findsOneWidget);
    expect(_footerText('4 new'), findsOneWidget);
    expect(_footerText('2d'), findsOneWidget);
    _expectOneLine(tester, <String>['17', '1.2K', '4 new', '2d']);
    _expectNoClippedText(tester);
  });

  testWidgets('the thumbnail asks the media proxy for a webp preview', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      _app(
        ForumPostCard(data: _data(thumbnail: true), onTap: () {}),
        width: 390,
      ),
    );
    await tester.pump();

    final Uri thumbnail = Uri.parse(
      tester
          .widget<CachedNetworkImage>(find.byType(CachedNetworkImage))
          .imageUrl,
    );
    expect(thumbnail.path, '/attachments/100/300/photo.png');
    expect(thumbnail.queryParameters['format'], 'webp');
    expect(thumbnail.queryParameters['width'], isNotNull);
    expect(thumbnail.queryParameters['height'], isNotNull);
  });

  testWidgets('the footer spans the card under the thumbnail', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final Map<bool, Rect> footers = <bool, Rect>{};
    final Map<bool, double> timeRight = <bool, double>{};
    for (final bool thumbnail in <bool>[false, true]) {
      await tester.pumpWidget(
        _app(
          ForumPostCard(
            data: _data(thumbnail: thumbnail),
            onTap: () {},
            showReaction: true,
            onToggleReaction: () {},
          ),
          width: 390,
        ),
      );
      await tester.pump();
      expect(tester.takeException(), isNull);
      footers[thumbnail] = tester.getRect(
        find.byKey(const ValueKey<String>('forumPostFooter')),
      );
      timeRight[thumbnail] = tester.getRect(_footerText('2d')).right;
      if (thumbnail) {
        final Rect image = tester.getRect(find.byType(ClipRRect).last);
        expect(image.width, 80);
        expect(footers[thumbnail]!.top, greaterThanOrEqualTo(image.bottom));
        expect(footers[thumbnail]!.right, closeTo(image.right, 0.5));
      }
    }
    expect(footers[true]!.width, closeTo(footers[false]!.width, 0.5));
    expect(timeRight[true], closeTo(timeRight[false]!, 0.5));
  });

  testWidgets('a wide list card keeps the same footer on one line', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      _app(
        ForumPostCard(
          data: _data(),
          onTap: () {},
          showReaction: true,
          onToggleReaction: () {},
        ),
        width: 900,
      ),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
    _expectOneLine(tester, <String>['17', '1.2K', '4 new', '2d']);
    final Rect footer = tester.getRect(
      find.byKey(const ValueKey<String>('forumPostFooter')),
    );
    expect(tester.getRect(_footerText('2d')).right, closeTo(footer.right, 0.5));
  });

  testWidgets('a gallery tile at half of a 390 pt phone stays on one line', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _app(ForumPostTile(data: _data(), onTap: () {}), width: 175, height: 220),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(_footerText('1.2K'), findsOneWidget);
    expect(_footerText('2d'), findsOneWidget);
    _expectOneLine(tester, <String>['1.2K', '2d']);
    _expectNoClippedText(tester);
  });

  testWidgets(
    'a tap on the preview opens the media and the title opens the post',
    (WidgetTester tester) async {
      final List<Attachment> opened = <Attachment>[];
      int postOpens = 0;
      await tester.pumpWidget(
        _app(
          ForumPostTile(
            data: _withAttachments(const <Attachment>[_photo]),
            onTap: () => postOpens++,
            onOpenMedia: opened.add,
          ),
          width: 175,
          height: 220,
        ),
      );
      await tester.pump();

      await tester.tapAt(_previewPoint(tester));
      expect(opened, <Attachment>[_photo]);
      expect(postOpens, 0);

      await tester.tap(
        find.text('What should the next community event be about'),
      );
      expect(opened, hasLength(1));
      expect(postOpens, 1);
    },
  );

  testWidgets('a tile without a shown preview opens the post', (
    WidgetTester tester,
  ) async {
    final List<Attachment> opened = <Attachment>[];
    int postOpens = 0;
    await tester.pumpWidget(
      _app(
        ForumPostTile(
          data: _withAttachments(const <Attachment>[_spoiler]),
          onTap: () => postOpens++,
          onOpenMedia: opened.add,
        ),
        width: 175,
        height: 220,
      ),
    );
    await tester.pump();

    await tester.tapAt(_previewPoint(tester));
    expect(opened, isEmpty);
    expect(postOpens, 1);
  });

  test('the viewer pages through shown images only', () {
    const Attachment video = Attachment(
      id: '302',
      filename: 'clip.mp4',
      url: 'https://media.invalid/clip.mp4',
      contentType: 'video/mp4',
    );
    const Attachment mature = Attachment(
      id: '303',
      filename: 'mature.png',
      url: 'https://media.invalid/mature.png',
      contentType: 'image/png',
      nsfw: true,
    );
    const Attachment second = Attachment(
      id: '304',
      filename: 'second.png',
      url: 'https://media.invalid/second.png',
      contentType: 'image/png',
    );
    final Message message = _withAttachments(const <Attachment>[
      _photo,
      _spoiler,
      video,
      mature,
      second,
    ]).firstMessage!;

    expect(forumViewerImages(message), <Attachment>[_photo, second]);
  });

  testWidgets('the new count drops before the time and nothing is cut', (
    WidgetTester tester,
  ) async {
    for (double width = 96; width <= 240; width += 4) {
      await tester.pumpWidget(
        _app(
          ForumPostTile(data: _data(), onTap: () {}),
          width: width,
          height: 220,
        ),
      );
      await tester.pump();

      expect(tester.takeException(), isNull, reason: 'width $width');
      if (_footerText('4 new').evaluate().isNotEmpty) {
        expect(_footerText('2d'), findsOneWidget, reason: 'width $width');
      }
      _expectNoClippedText(tester);
    }
  });

  testWidgets('tag chips are borderless rounded rectangles', (
    WidgetTester tester,
  ) async {
    const ForumTagResponse tag = ForumTagResponse(
      id: '1',
      name: 'Ideas',
      moderated: false,
      emojiId: null,
      emojiName: null,
    );
    final Map<bool, double> heights = <bool, double>{};
    for (final bool selected in <bool>[false, true]) {
      for (final bool compact in <bool>[false, true]) {
        await tester.pumpWidget(
          _app(
            Center(
              child: ForumTagChip(
                tag: tag,
                selected: selected,
                compact: compact,
              ),
            ),
            width: 390,
          ),
        );
        final BoxDecoration decoration =
            tester
                    .widget<Container>(
                      find.descendant(
                        of: find.byType(ForumTagChip),
                        matching: find.byType(Container),
                      ),
                    )
                    .decoration!
                as BoxDecoration;
        expect(decoration.border, isNull);
        expect(decoration.borderRadius, BorderRadius.circular(8));
        heights[compact] = tester.getSize(find.byType(ForumTagChip)).height;
        expect(
          heights[compact],
          closeTo(
            ForumTagChip.rowHeight(
              tester.element(find.byType(ForumTagChip)),
              compact: compact,
            ),
            1,
          ),
        );
      }
    }
    expect(heights[false]! - heights[true]!, inInclusiveRange(4, 16));
  });
}
