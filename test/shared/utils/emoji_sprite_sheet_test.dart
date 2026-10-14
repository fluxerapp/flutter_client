import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';

import '../../helpers/recording_asset_channel.dart';

const String _kSpritePrefix = 'assets/emoji-sprites/';
const String _kWave = '\u{1F44B}';

Widget _host(List<Widget> children) => Directionality(
  textDirection: TextDirection.ltr,
  child: Align(
    alignment: Alignment.topLeft,
    child: Row(mainAxisSize: MainAxisSize.min, children: children),
  ),
);

SpriteEmoji _wave({Key? key}) =>
    SpriteEmoji(key: key, emoji: _kWave, index: 0, size: 32);

Iterable<EmojiSpritePainter> _spritePainters(WidgetTester tester) => tester
    .widgetList<CustomPaint>(find.byType(CustomPaint))
    .map((CustomPaint paint) => paint.painter)
    .whereType<EmojiSpritePainter>();

Future<void> _pumpUntilPainted(WidgetTester tester, int count) async {
  for (int i = 0; i < 300 && _spritePainters(tester).length < count; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 10)),
    );
    await tester.pump();
  }
  expect(_spritePainters(tester), hasLength(count));
}

Future<void> _unmountAndDrain(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox());
  await tester.pump(kEmojiSpriteSheetReleaseDelay);
}

void main() {
  late RecordingAssetChannel assets;

  setUp(() {
    assets = RecordingAssetChannel.install();
  });

  tearDown(EmojiSpriteSheet.release);

  test('keeps the outer pixel of the first non-diversity cell', () {
    expect(
      EmojiSpriteSheet.spriteRect(0, diversity: false),
      const Rect.fromLTWH(0, 0, 64, 64),
    );
  });

  test('advances one full 64px column for the next non-diversity sprite', () {
    expect(
      EmojiSpriteSheet.spriteRect(1, diversity: false),
      const Rect.fromLTWH(64, 0, 64, 64),
    );
  });

  test('wraps to the next full 64px row after 42 non-diversity sprites', () {
    expect(
      EmojiSpriteSheet.spriteRect(42, diversity: false),
      const Rect.fromLTWH(0, 64, 64, 64),
    );
  });

  test('wraps to the next full 64px row after 10 diversity sprites', () {
    expect(
      EmojiSpriteSheet.spriteRect(10, diversity: true),
      const Rect.fromLTWH(0, 64, 64, 64),
    );
  });

  test(
    'a failed decode is retried by the next ensureLoaded instead of leaving the picker blank all session',
    () async {
      bool fail = true;
      assets.respond = (String key) =>
          fail && key.startsWith(_kSpritePrefix) ? Future.value() : null;

      await expectLater(EmojiSpriteSheet.ensureLoaded(), throwsA(anything));
      fail = false;
      final ui.Image sheet = await EmojiSpriteSheet.ensureLoaded();

      expect(sheet.width, 2688);
      expect(sheet.height, 3008);
      expect(assets.requestsMatching(_kSpritePrefix), 2);
    },
  );

  test(
    'concurrent preload and ensureLoaded decode the 31 MiB sheet once, not twice',
    () async {
      await Future.wait(<Future<void>>[
        EmojiSpriteSheet.preload(),
        EmojiSpriteSheet.ensureLoaded(),
        EmojiSpriteSheet.preload(),
      ]);

      expect(assets.requestsMatching(_kSpritePrefix), 1);
      expect(EmojiSpriteSheet.imageFor(), isNotNull);
    },
  );

  testWidgets(
    'shows the system emoji glyph while the sheet decodes instead of a blank cell',
    (WidgetTester tester) async {
      final Completer<ByteData?> held = Completer<ByteData?>();
      assets.respond = (String key) =>
          key.startsWith(_kSpritePrefix) ? held.future : null;

      await tester.pumpWidget(_host(<Widget>[_wave()]));

      expect(find.text(_kWave), findsOneWidget);
      expect(_spritePainters(tester), isEmpty);

      held.complete(null);
      await tester.pump();
    },
  );

  testWidgets(
    'an unloaded SpriteEmoji starts the decode itself, so a restored composer chip is not stuck on the glyph',
    (WidgetTester tester) async {
      await tester.pumpWidget(_host(<Widget>[_wave()]));
      await _pumpUntilPainted(tester, 1);

      expect(assets.requestsMatching(_kSpritePrefix), 1);
      expect(find.text(_kWave), findsNothing);

      await _unmountAndDrain(tester);
    },
  );

  testWidgets(
    'releases the sheet 30 s after the last SpriteEmoji unmounts, not before',
    (WidgetTester tester) async {
      await tester.pumpWidget(_host(<Widget>[_wave()]));
      await _pumpUntilPainted(tester, 1);

      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(seconds: 29));
      expect(EmojiSpriteSheet.imageFor(), isNotNull);

      await tester.pump(const Duration(seconds: 1));
      expect(EmojiSpriteSheet.imageFor(), isNull);
    },
  );

  testWidgets('keeps the sheet while another SpriteEmoji is still mounted', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _host(<Widget>[
        _wave(key: const ValueKey<int>(1)),
        _wave(key: const ValueKey<int>(2)),
      ]),
    );
    await _pumpUntilPainted(tester, 2);
    await tester.pumpWidget(
      _host(<Widget>[_wave(key: const ValueKey<int>(2))]),
    );
    await tester.pump(const Duration(seconds: 60));

    expect(EmojiSpriteSheet.imageFor(), isNotNull);
    expect(_spritePainters(tester).single.image.debugDisposed, isFalse);

    await _unmountAndDrain(tester);
  });

  testWidgets(
    'a background release frees the mounted clone, shows the glyph, and decodes again once frames resume',
    (WidgetTester tester) async {
      await tester.pumpWidget(_host(<Widget>[_wave()]));
      await _pumpUntilPainted(tester, 1);
      final ui.Image painted = _spritePainters(tester).single.image;

      EmojiSpriteSheet.release();
      expect(painted.debugDisposed, isTrue);
      expect(EmojiSpriteSheet.imageFor(), isNull);
      expect(assets.requestsMatching(_kSpritePrefix), 1);

      await tester.pump();
      expect(find.text(_kWave), findsOneWidget);
      expect(_spritePainters(tester), isEmpty);

      await _pumpUntilPainted(tester, 1);
      expect(assets.requestsMatching(_kSpritePrefix), 2);
      expect(_spritePainters(tester).single.image.debugDisposed, isFalse);

      await _unmountAndDrain(tester);
    },
  );

  testWidgets(
    'a decode that lands after a background release is dropped, and only a resumed build decodes again',
    (WidgetTester tester) async {
      final Completer<void> firstDecodeGate = Completer<void>();
      assets.respond = (String key) =>
          key.startsWith(_kSpritePrefix) &&
              assets.requestsMatching(_kSpritePrefix) == 1
          ? firstDecodeGate.future.then((_) => serveBundledTestAsset(key))
          : null;
      await tester.pumpWidget(_host(<Widget>[_wave()]));
      bool inFlightSettled = false;
      Object? inFlightError;
      unawaited(
        EmojiSpriteSheet.ensureLoaded().then<void>(
          (ui.Image _) => inFlightSettled = true,
          onError: (Object error) {
            inFlightError = error;
            inFlightSettled = true;
          },
        ),
      );

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      EmojiSpriteSheet.release();
      firstDecodeGate.complete();
      for (int i = 0; i < 300 && !inFlightSettled; i++) {
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 10)),
        );
        await tester.binding.delayed(Duration.zero);
      }

      expect(inFlightSettled, isTrue);
      expect(inFlightError, isA<StateError>());
      expect(EmojiSpriteSheet.imageFor(), isNull);
      expect(assets.requestsMatching(_kSpritePrefix), 1);

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pump();
      await _pumpUntilPainted(tester, 1);
      expect(assets.requestsMatching(_kSpritePrefix), 2);
      expect(_spritePainters(tester).single.image.debugDisposed, isFalse);

      await _unmountAndDrain(tester);
    },
  );
}
