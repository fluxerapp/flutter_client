import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/pending_attachment_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_attachment_area.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

const MethodChannel _attachmentMediaChannel = MethodChannel(
  'fluxer_app/attachment_media',
);

final Uint8List _transparentPng = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==',
);

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

  testWidgets('a video from Files shows a frame from the file', (
    WidgetTester tester,
  ) async {
    final List<MethodCall> calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_attachmentMediaChannel, (
          MethodCall call,
        ) async {
          calls.add(call);
          return _transparentPng;
        });
    addTearDown(
      () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(_attachmentMediaChannel, null),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          cloudUploadControllerProvider('channel-1').overrideWith(
            () => _StaticUploads(<PendingAttachment>[
              PendingAttachment(
                id: 1,
                channelId: 'channel-1',
                file: XFile('/picked/clip.mov'),
                filename: 'clip.mov',
                size: 2048,
                contentType: 'video/quicktime',
                status: PendingAttachmentStatus.pending,
                uploadProgress: 0,
              ),
            ]),
          ),
        ],
        child: _buildTestApp(
          child: const ChannelAttachmentArea(channelId: 'channel-1'),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(calls.single.method, 'videoThumbnail');
    expect(
      (calls.single.arguments as Map<Object?, Object?>)['path'],
      '/picked/clip.mov',
    );
    expect(find.byKey(PendingAttachmentPreview.thumbnailKey), findsOneWidget);
    expect(find.byKey(PendingAttachmentPreview.playBadgeKey), findsOneWidget);
  });

  testWidgets('a photo chip decodes at chip size, not full resolution', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          cloudUploadControllerProvider('channel-1').overrideWith(
            () => _StaticUploads(<PendingAttachment>[
              PendingAttachment(
                id: 1,
                channelId: 'channel-1',
                file: XFile('/picked/IMG_0001.JPG'),
                filename: 'IMG_0001.JPG',
                size: 8 * 1024 * 1024,
                contentType: 'image/jpeg',
                status: PendingAttachmentStatus.pending,
                uploadProgress: 0,
              ),
            ]),
          ),
        ],
        child: _buildTestApp(
          child: const ChannelAttachmentArea(channelId: 'channel-1'),
        ),
      ),
    );
    await tester.pump();

    final Image image = tester.widget(find.byType(Image));
    expect(image.image, isA<ResizeImage>());
    final ResizeImage resized = image.image as ResizeImage;
    final int chipPixels = (150 * tester.view.devicePixelRatio).round();
    expect(resized.width ?? resized.height, lessThanOrEqualTo(chipPixels));
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
