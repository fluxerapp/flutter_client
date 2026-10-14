import 'package:cross_file/cross_file.dart';
import 'package:flutter/rendering.dart' show RenderEditable;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_attachment_area.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/reply_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_composer_column.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/composer_channel_textarea_harness.dart';
import '../../../../../helpers/open_test_database.dart';

const double _kHeaderHeight = 64;
const Key _kHeaderKey = ValueKey<String>('test-channel-header');

Finder _bar() => find.byKey(const ValueKey<String>('mobile-composer-bar'));

class _Uploads extends CloudUploadController {
  _Uploads(this._initial);

  final List<PendingAttachment> _initial;

  @override
  CloudComposerAttachments build(String channelId) =>
      CloudComposerAttachments(_initial);
}

PendingAttachment _image(int id) {
  return PendingAttachment(
    id: id,
    channelId: kComposerHarnessChannelA,
    file: XFile('/nowhere/photo-$id.png'),
    filename: 'photo-$id.png',
    size: 68 * 1024,
    contentType: 'image/png',
    status: PendingAttachmentStatus.uploading,
    uploadProgress: 0.5,
  );
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

class _ChannelPage extends StatefulWidget {
  const _ChannelPage();

  @override
  State<_ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<_ChannelPage> {
  final ComposerAutocompletePanelHost _host = ComposerAutocompletePanelHost(
    null,
  );
  final ScrollController _scroll = ScrollController();

  @override
  void dispose() {
    _host.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            const SizedBox(key: _kHeaderKey, height: _kHeaderHeight),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    children: <Widget>[
                      const Expanded(child: SizedBox.expand()),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight:
                              constraints.maxHeight -
                              WideComposerLayout.statusRowHeight,
                        ),
                        child: ChatComposerColumn(
                          autocompletePanelHost: _host,
                          autocompletePanelScrollController: _scroll,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef _Phone = ({Size size, double top, double keyboard});

const _Phone _small = (size: Size(320, 568), top: 20, keyboard: 253);
const _Phone _regular = (size: Size(390, 844), top: 47, keyboard: 336);

Future<ProviderContainer> _pump(
  WidgetTester tester,
  _Phone phone, {
  List<PendingAttachment> attachments = const <PendingAttachment>[],
}) async {
  final ProviderContainer container = await pumpComposerChannelTextareaHarness(
    tester,
    home: const _ChannelPage(),
    extraOverrides: [
      cloudUploadControllerProvider(
        kComposerHarnessChannelA,
      ).overrideWith(() => _Uploads(attachments)),
    ],
  );
  tester.view.physicalSize = phone.size;
  tester.view.padding = FakeViewPadding(top: phone.top);
  tester.view.viewInsets = FakeViewPadding(bottom: phone.keyboard);
  addTearDown(tester.view.resetPadding);
  addTearDown(tester.view.resetViewInsets);
  await tester.pumpAndSettle();
  return container;
}

Future<void> _typeLong(WidgetTester tester) async {
  await tester.enterText(
    channelComposerField(),
    List<String>.filled(90, 'this menu has always felt out of place').join(' '),
  );
  await tester.pumpAndSettle();
}

void _expectFitsAndScrolls(WidgetTester tester, _Phone phone) {
  expect(tester.takeException(), isNull);
  final Rect bar = tester.getRect(_bar());
  final double headerBottom = tester.getRect(find.byKey(_kHeaderKey)).bottom;
  final double keyboardTop = phone.size.height - phone.keyboard;
  expect(bar.top, greaterThanOrEqualTo(headerBottom));
  expect(bar.bottom, lessThanOrEqualTo(keyboardTop));

  final Rect field = tester.getRect(channelComposerField());
  expect(field.top, greaterThanOrEqualTo(bar.top));
  expect(field.bottom, lessThanOrEqualTo(bar.bottom));

  final EditableTextState editable = tester.state<EditableTextState>(
    find.descendant(
      of: channelComposerField(),
      matching: find.byType(EditableText),
    ),
  );
  final ScrollableState scroll = tester.state<ScrollableState>(
    find.descendant(
      of: channelComposerField(),
      matching: find.byType(Scrollable),
    ),
  );
  expect(scroll.position.maxScrollExtent, greaterThan(0));
  expect(scroll.position.pixels, closeTo(scroll.position.maxScrollExtent, 1));

  final RenderEditable render = editable.renderEditable;
  final Rect caret = MatrixUtils.transformRect(
    render.getTransformTo(null),
    render.getLocalRectForCaret(render.selection!.extent),
  );
  final Rect visible = MatrixUtils.transformRect(
    render.getTransformTo(null),
    Offset.zero & render.size,
  );
  expect(caret.top, greaterThanOrEqualTo(visible.top - 0.5));
  expect(caret.bottom, lessThanOrEqualTo(visible.bottom + 0.5));
  expect(caret.bottom, lessThanOrEqualTo(keyboardTop));
}

Future<void> _release(WidgetTester tester) async {
  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pump(const Duration(milliseconds: 400));
  await releaseTestWidgetTree(tester);
}

void main() {
  for (final _Phone phone in <_Phone>[_small, _regular]) {
    final String name =
        '${phone.size.width.toInt()}x${phone.size.height.toInt()}';

    group('on a $name phone with the keyboard up', () {
      testWidgets('a long message scrolls inside a bounded bar', (
        tester,
      ) async {
        await _pump(tester, phone);
        await _typeLong(tester);
        _expectFitsAndScrolls(tester, phone);
        await _release(tester);
      });

      testWidgets('a long message with an image stays above the keyboard', (
        tester,
      ) async {
        await _pump(tester, phone, attachments: <PendingAttachment>[_image(1)]);
        await _typeLong(tester);
        expect(
          find.descendant(
            of: _bar(),
            matching: find.byKey(ChannelAttachmentArea.stripKey),
          ),
          findsOneWidget,
        );
        _expectFitsAndScrolls(tester, phone);
        await _release(tester);
      });

      testWidgets('a long message with a reply and an image fits', (
        tester,
      ) async {
        final ProviderContainer container = await _pump(
          tester,
          phone,
          attachments: <PendingAttachment>[_image(1)],
        );
        readMutableChatViewModel(container).setReplyingTo(_reply());
        await tester.pumpAndSettle();
        await _typeLong(tester);
        expect(
          find.descendant(of: _bar(), matching: find.byType(ReplyInputBar)),
          findsOneWidget,
        );
        _expectFitsAndScrolls(tester, phone);
        await _release(tester);
      });
    });
  }
}
