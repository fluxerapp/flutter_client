import 'dart:math' as math;

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_attachment_area.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_textarea.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/reply_preview.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
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

Finder _strip() => find.byKey(ChannelAttachmentArea.stripKey);

class _Uploads extends CloudUploadController {
  _Uploads(this._initial);

  final List<PendingAttachment> _initial;

  @override
  CloudComposerAttachments build(String channelId) =>
      CloudComposerAttachments(_initial);

  void set(List<PendingAttachment> items) =>
      state = CloudComposerAttachments(items);
}

PendingAttachment _file(int id) {
  return PendingAttachment(
    id: id,
    channelId: kComposerHarnessChannelA,
    file: XFile('/nowhere/notes-$id.txt'),
    filename: 'notes-$id.txt',
    size: 2048,
    contentType: 'text/plain',
    status: PendingAttachmentStatus.uploading,
    uploadProgress: 0.5,
  );
}

Future<(ProviderContainer, _Uploads)> _pumpWithUploads(
  WidgetTester tester,
  List<PendingAttachment> items,
) async {
  final _Uploads uploads = _Uploads(items);
  final ProviderContainer container = await pumpComposerChannelTextareaHarness(
    tester,
    extraOverrides: [
      cloudUploadControllerProvider(
        kComposerHarnessChannelA,
      ).overrideWith(() => uploads),
    ],
  );
  await tester.enterText(channelComposerField(), '');
  await tester.pumpAndSettle();
  return (container, uploads);
}

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

  for (final bool canAttachFiles in <bool>[true, false]) {
    testWidgets(
      'a read-only channel shows neither send nor mic (attach $canAttachFiles)',
      (tester) async {
        await pumpComposerChannelTextareaHarness(
          tester,
          guildChannelPermissions: ChannelMessagePermissions(
            isResolved: true,
            canSendMessages: false,
            canAttachFiles: canAttachFiles,
            canEmbedLinks: true,
            canUseExternalEmojis: true,
            canUseExternalStickers: true,
          ),
        );
        await tester.pumpAndSettle();
        expect(_send(), findsNothing);
        expect(_voice(), findsNothing);
        expect(_emoji(), findsNothing);
        await _release(tester);
      },
    );
  }

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

  testWidgets('a long message stops growing after five lines', (tester) async {
    await _pumpEmpty(tester);
    await tester.enterText(channelComposerField(), 'x');
    await tester.pumpAndSettle();
    final double line = _lineHeight(tester);
    await tester.enterText(
      channelComposerField(),
      List<String>.generate(30, (int i) => 'line $i').join('\n'),
    );
    await tester.pumpAndSettle();
    expect(tester.getRect(_bar()).height, closeTo(line * 5 + 36, 1));
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

  testWidgets('pending attachments sit inside the bar above the text row', (
    tester,
  ) async {
    final (ProviderContainer container, _) = await _pumpWithUploads(
      tester,
      <PendingAttachment>[_file(1)],
    );
    readMutableChatViewModel(container).setReplyingTo(_reply());
    await tester.pumpAndSettle();

    expect(find.descendant(of: _bar(), matching: _strip()), findsOneWidget);
    expect(
      find.descendant(
        of: _bar(),
        matching: find.byKey(ChannelAttachmentArea.uploadProgressKey),
      ),
      findsOneWidget,
    );
    final Rect bar = tester.getRect(_bar());
    final Rect reply = tester.getRect(find.byType(ReplyInputBar));
    final Rect strip = tester.getRect(_strip());
    final Rect field = tester.getRect(channelComposerField());
    expect(reply.top, greaterThanOrEqualTo(bar.top));
    expect(strip.top, greaterThanOrEqualTo(reply.bottom));
    expect(field.top, greaterThan(strip.bottom));
    expect(bar.top - tester.getRect(find.byType(ChannelTextarea)).top, 4);
    expect(tester.getRect(_attach()).center.dy, bar.bottom - 29);
    await _release(tester);
  });

  testWidgets('adding and removing attachments animates the bar height', (
    tester,
  ) async {
    final (_, _Uploads uploads) = await _pumpWithUploads(
      tester,
      const <PendingAttachment>[],
    );
    final double rest = tester.getRect(_bar()).height;

    uploads.set(<PendingAttachment>[_file(1)]);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 80));
    final double growing = tester.getRect(_bar()).height;
    await tester.pumpAndSettle();
    final double grown = tester.getRect(_bar()).height;
    expect(grown, greaterThan(rest + 150));
    expect(growing, greaterThan(rest));
    expect(growing, lessThan(grown));

    uploads.set(const <PendingAttachment>[]);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 80));
    final double shrinking = tester.getRect(_bar()).height;
    expect(shrinking, greaterThan(rest));
    expect(shrinking, lessThan(grown));
    await tester.pumpAndSettle();
    expect(tester.getRect(_bar()).height, rest);
    await _release(tester);
  });

  testWidgets('a tall header scrolls inside the bar with the keyboard up', (
    tester,
  ) async {
    final (ProviderContainer container, _) = await _pumpWithUploads(
      tester,
      <PendingAttachment>[_file(1), _file(2)],
    );
    readMutableChatViewModel(container).setReplyingTo(_reply());
    tester.view.physicalSize = const Size(320, 568);
    tester.view.viewInsets = const FakeViewPadding(bottom: 260);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpAndSettle();

    final Finder header = find.byKey(
      const ValueKey<String>('mobile-composer-header'),
    );
    final double headerHeight = tester.getRect(header).height;
    expect(headerHeight, closeTo((568 - 260) * 0.35, 0.5));
    final ScrollableState scroll = tester.state<ScrollableState>(
      find.descendant(of: header, matching: find.byType(Scrollable)).first,
    );
    expect(scroll.position.maxScrollExtent, greaterThan(0));
    await tester.drag(header, const Offset(0, -200));
    await tester.pumpAndSettle();
    expect(scroll.position.pixels, scroll.position.maxScrollExtent);
    expect(tester.takeException(), isNull);
    await _release(tester);
  });
}
