import 'package:cross_file/cross_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_attachment_area.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('a file that is pre-uploading shows its progress', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          cloudUploadControllerProvider('channel-1').overrideWith(
            () => _StaticUploads(<PendingAttachment>[
              _attachment(PendingAttachmentStatus.uploading, 0.4),
            ]),
          ),
        ],
        child: _buildTestApp(
          child: const ChannelAttachmentArea(channelId: 'channel-1'),
        ),
      ),
    );
    await tester.pump();

    final LinearProgressIndicator bar = tester.widget(
      find.byKey(ChannelAttachmentArea.uploadProgressKey),
    );
    expect(bar.value, 0.4);
  });

  testWidgets('a pre-uploaded file shows no progress', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          cloudUploadControllerProvider('channel-1').overrideWith(
            () => _StaticUploads(<PendingAttachment>[
              _attachment(PendingAttachmentStatus.sending, 1),
            ]),
          ),
        ],
        child: _buildTestApp(
          child: const ChannelAttachmentArea(channelId: 'channel-1'),
        ),
      ),
    );
    await tester.pump();

    expect(find.byKey(ChannelAttachmentArea.uploadProgressKey), findsNothing);
  });

  testWidgets('a horizontal drag scrolls the chips instead of reordering', (
    WidgetTester tester,
  ) async {
    final List<PendingAttachment> items = List<PendingAttachment>.generate(
      10,
      (int i) => _attachment(PendingAttachmentStatus.sending, 1, id: i),
    );
    final _StaticUploads uploads = _StaticUploads(items);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          cloudUploadControllerProvider(
            'channel-1',
          ).overrideWith(() => uploads),
        ],
        child: _buildTestApp(
          child: const ChannelAttachmentArea(channelId: 'channel-1'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.drag(
      find.byType(ChannelAttachmentArea),
      const Offset(-400, 0),
    );
    await tester.pumpAndSettle();

    final ScrollableState state = tester.state<ScrollableState>(
      find.byType(Scrollable).first,
    );
    expect(state.position.pixels, greaterThan(0));
    expect(uploads.reorders, isEmpty);
  });
}

PendingAttachment _attachment(
  PendingAttachmentStatus status,
  double progress, {
  int id = 1,
}) {
  return PendingAttachment(
    id: id,
    channelId: 'channel-1',
    file: XFile('/nowhere/notes.txt'),
    filename: 'notes.txt',
    size: 2048,
    contentType: 'text/plain',
    status: status,
    uploadProgress: progress,
  );
}

class _StaticUploads extends CloudUploadController {
  _StaticUploads(this._items);

  final List<PendingAttachment> _items;

  final List<(int, int)> reorders = <(int, int)>[];

  @override
  CloudComposerAttachments build(String channelId) =>
      CloudComposerAttachments(_items);

  @override
  void reorderAttachments(int oldIndex, int newIndex) {
    reorders.add((oldIndex, newIndex));
  }
}

Widget _buildTestApp({required Widget child}) {
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
    home: Scaffold(body: child),
  );
}
