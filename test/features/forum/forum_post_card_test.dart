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
