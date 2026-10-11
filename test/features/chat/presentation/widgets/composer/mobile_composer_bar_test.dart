import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_textarea.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/reply_preview.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';

import '../../../../../helpers/composer_channel_textarea_harness.dart';
import '../../../../../helpers/open_test_database.dart';

Finder _bar() => find.byKey(const ValueKey<String>('mobile-composer-bar'));
Finder _attach() =>
    find.byKey(const ValueKey<String>('mobile-composer-attach'));
Finder _emoji() => find.byKey(const ValueKey<String>('mobile-composer-emoji'));
Finder _send() => find.byKey(const ValueKey<String>('mobile-composer-send'));
Finder _voice() => find.byKey(const ValueKey<String>('voice'));

Future<ProviderContainer> _pumpEmpty(WidgetTester tester) async {
  final ProviderContainer container = await pumpComposerChannelTextareaHarness(
    tester,
  );
  await tester.enterText(channelComposerField(), '');
  await tester.pumpAndSettle();
  return container;
}

double _lineHeight(WidgetTester tester) =>
    tester.getRect(find.byType(EditableText)).height;

double _restHeight(WidgetTester tester) =>
    math.max(58, _lineHeight(tester) + 36);

Future<void> _release(WidgetTester tester) async {
  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pump(const Duration(milliseconds: 400));
  await releaseTestWidgetTree(tester);
}

Message _reply() {
  return Message(
    id: '1000000000000000300',
    channelId: kComposerHarnessChannelA,
    authorId: '2000000000000000001',
    authorName: 'Alice',
    content: 'hello',
    timestamp: DateTime.utc(2026, 10, 11),
  );
}

void main() {
  testWidgets('one rounded bar floats with every control inside it', (
    tester,
  ) async {
    await _pumpEmpty(tester);

    final Rect bar = tester.getRect(_bar());
    final Rect textarea = tester.getRect(find.byType(ChannelTextarea));
    expect(bar.left, 16);
    expect(bar.right, 384);
    expect(bar.height, greaterThanOrEqualTo(58));
    expect(bar.height, _restHeight(tester));
    expect(textarea.bottom - bar.bottom, 10);

    for (final Finder control in <Finder>[
      _attach(),
      channelComposerField(),
      _emoji(),
      _voice(),
    ]) {
      expect(find.descendant(of: _bar(), matching: control), findsOneWidget);
    }
    expect(
      find.descendant(of: _bar(), matching: find.byType(FluxerButton)),
      findsNothing,
    );

    final Rect attach = tester.getRect(_attach());
    final Rect emoji = tester.getRect(_emoji());
    final Rect voice = tester.getRect(_voice());
    expect(attach.size, const Size(32, 32));
    expect(attach.left, bar.left + 13);
    expect(attach.center.dy, bar.bottom - 29);
    expect(emoji.size, const Size(32, 32));
    expect(emoji.center.dy, bar.bottom - 29);
    expect(voice.center, Offset(bar.right - 11 - 18, bar.bottom - 29));
    expect(emoji.right + 10, voice.left);
    await _release(tester);
  });

  testWidgets('typing pops in an accent send square where the mic was', (
    tester,
  ) async {
    await _pumpEmpty(tester);
    final Rect barAtRest = tester.getRect(_bar());
    final Rect emojiAtRest = tester.getRect(_emoji());

    await tester.enterText(channelComposerField(), 'hi');
    await tester.pump();
    expect(_voice(), findsNothing);
    expect(_send(), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 40));
    final double midScale = tester
        .widget<ScaleTransition>(
          find.ancestor(of: _send(), matching: find.byType(ScaleTransition)),
        )
        .scale
        .value;
    expect(midScale, greaterThan(0.7));
    expect(midScale, lessThan(1));
    await tester.pumpAndSettle();

    final Rect bar = tester.getRect(_bar());
    final Rect send = tester.getRect(_send());
    expect(send.size, const Size(36, 36));
    expect(send.right, bar.right - 11);
    expect(send.bottom, bar.bottom - 11);
    final Rect emoji = tester.getRect(_emoji());
    expect(emoji.left, emojiAtRest.left);
    expect(bar.bottom - emoji.bottom, barAtRest.bottom - emojiAtRest.bottom);
    final DecoratedBox box = tester.widget<DecoratedBox>(_send());
    final ShapeDecoration decoration = box.decoration as ShapeDecoration;
    expect(decoration.color, buildDarkColorTheme().brandPrimary);
    final RoundedSuperellipseBorder shape =
        decoration.shape as RoundedSuperellipseBorder;
    expect(shape.borderRadius, BorderRadius.circular(10));

    await tester.enterText(channelComposerField(), '');
    await tester.pump();
    expect(_send(), findsNothing);
    expect(_voice(), findsOneWidget);
    await _release(tester);
  });

  testWidgets('new lines grow the bar and keep controls on the bottom row', (
    tester,
  ) async {
    await _pumpEmpty(tester);
    final double restHeight = tester.getRect(_bar()).height;

    await tester.enterText(channelComposerField(), 'a\nb\nc');
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 30));
    final double midHeight = tester.getRect(_bar()).height;
    await tester.pumpAndSettle();
    final Rect bar = tester.getRect(_bar());
    expect(bar.height, greaterThan(restHeight + 30));
    expect(midHeight, greaterThan(restHeight));
    expect(midHeight, lessThan(bar.height));

    final Rect send = tester.getRect(_send());
    expect(send.bottom, bar.bottom - 11);
    expect(tester.getRect(_attach()).center.dy, send.center.dy);
    expect(tester.getRect(_emoji()).center.dy, send.center.dy);
    await _release(tester);
  });

  testWidgets('a long message stops growing after nine lines', (tester) async {
    await _pumpEmpty(tester);
    await tester.enterText(channelComposerField(), 'x');
    await tester.pumpAndSettle();
    final double line = _lineHeight(tester);
    await tester.enterText(
      channelComposerField(),
      List<String>.generate(30, (int i) => 'line $i').join('\n'),
    );
    await tester.pumpAndSettle();
    expect(tester.getRect(_bar()).height, closeTo(line * 9 + 36, 1));
    await _release(tester);
  });

  testWidgets('the reply header grows the bar and collapses on cancel', (
    tester,
  ) async {
    final ProviderContainer container = await _pumpEmpty(tester);
    final double rest = _restHeight(tester);
    readMutableChatViewModel(container).setReplyingTo(_reply());
    await tester.pumpAndSettle();

    expect(
      find.descendant(of: _bar(), matching: find.byType(ReplyInputBar)),
      findsOneWidget,
    );
    expect(tester.getRect(_bar()).height, rest + 32);

    readMutableChatViewModel(container).cancelReply();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    final double collapsing = tester.getRect(_bar()).height;
    expect(collapsing, greaterThan(rest));
    expect(collapsing, lessThan(rest + 32));
    await tester.pumpAndSettle();
    expect(tester.getRect(_bar()).height, rest);
    await _release(tester);
  });

  testWidgets('the attach button rotates into a close cross', (tester) async {
    final ProviderContainer container = await _pumpEmpty(tester);
    AnimatedRotation rotation() => tester.widget<AnimatedRotation>(
      find.descendant(of: _attach(), matching: find.byType(AnimatedRotation)),
    );
    expect(rotation().turns, 0);

    container.read(attachmentPanelProvider.notifier).open();
    await tester.pump();
    expect(rotation().turns, 0.125);
    container.read(attachmentPanelProvider.notifier).close();
    await tester.pumpAndSettle();
    await _release(tester);
  });

  testWidgets('screen readers can activate the composer buttons', (
    tester,
  ) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await _pumpEmpty(tester);
    expect(
      tester
          .getSemantics(_attach())
          .getSemanticsData()
          .hasAction(SemanticsAction.tap),
      isTrue,
    );
    expect(
      tester
          .getSemantics(_emoji())
          .getSemanticsData()
          .hasAction(SemanticsAction.tap),
      isTrue,
    );

    await tester.enterText(channelComposerField(), 'hi');
    await tester.pumpAndSettle();
    expect(
      tester
          .getSemantics(_send())
          .getSemanticsData()
          .hasAction(SemanticsAction.tap),
      isTrue,
    );

    await _release(tester);
    handle.dispose();
  });

  testWidgets('pressing the emoji button dims it until release', (
    tester,
  ) async {
    await _pumpEmpty(tester);
    double opacity() => tester
        .widget<AnimatedOpacity>(
          find.descendant(of: _emoji(), matching: find.byType(AnimatedOpacity)),
        )
        .opacity;
    expect(opacity(), 1);

    final TestGesture gesture = await tester.startGesture(
      tester.getCenter(_emoji()),
    );
    await tester.pump();
    expect(opacity(), lessThan(0.5));
    await gesture.cancel();
    await tester.pump();
    expect(opacity(), 1);
    await _release(tester);
  });
}
