import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_native_pickers.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';

const MethodChannel _attachmentMediaChannel = MethodChannel(
  'fluxer_app/attachment_media',
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final List<MethodCall> calls = <MethodCall>[];
  Object? reply;

  setUp(() {
    calls.clear();
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_attachmentMediaChannel, (
          MethodCall call,
        ) async {
          calls.add(call);
          return reply;
        });
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_attachmentMediaChannel, null);
  });

  test('the picker opens with attached photos checked', () async {
    reply = <Object?>[];

    await pickNativeGallerySelection(
      attachments: <PendingAttachment>[
        _attachment(1, galleryAssetId: 'asset-a'),
        _attachment(2),
      ],
    );

    expect(calls.single.method, 'pick');
    expect(calls.single.arguments, <String, Object>{
      'limit': 9,
      'selected': <String>['asset-a'],
    });
  });

  test('new picks keep their library name and asset id', () async {
    reply = <Object?>[
      <String, Object?>{'assetId': 'asset-a'},
      <String, Object?>{
        'assetId': 'asset-b',
        'path': '/tmp/picked/IMG_0568.GIF',
        'name': 'IMG_0568.GIF',
      },
    ];

    final GallerySelectionChange change = await pickNativeGallerySelection(
      attachments: <PendingAttachment>[
        _attachment(1, galleryAssetId: 'asset-a'),
      ],
    );

    expect(change.removedAssetIds, isEmpty);
    expect(change.added, hasLength(1));
    expect(change.added.single.file.path, '/tmp/picked/IMG_0568.GIF');
    expect(change.added.single.displayFilename, 'IMG_0568.GIF');
    expect(change.added.single.galleryAssetId, 'asset-b');
  });

  test('unchecking an attached photo removes it', () async {
    reply = <Object?>[
      <String, Object?>{
        'assetId': 'asset-b',
        'path': '/tmp/picked/IMG_0570.PNG',
        'name': 'IMG_0570.PNG',
      },
    ];

    final GallerySelectionChange change = await pickNativeGallerySelection(
      attachments: <PendingAttachment>[
        _attachment(1, galleryAssetId: 'asset-a'),
      ],
    );

    expect(change.removedAssetIds, <String>{'asset-a'});
  });

  test('cancelling changes nothing', () async {
    reply = null;

    final GallerySelectionChange change = await pickNativeGallerySelection(
      attachments: <PendingAttachment>[
        _attachment(1, galleryAssetId: 'asset-a'),
      ],
    );

    expect(change.added, isEmpty);
    expect(change.removedAssetIds, isEmpty);
  });
}

PendingAttachment _attachment(int id, {String? galleryAssetId}) {
  return PendingAttachment(
    id: id,
    channelId: 'channel-1',
    file: XFile('/nowhere/$id.jpg'),
    filename: '$id.jpg',
    size: 1,
    contentType: 'image/jpeg',
    status: PendingAttachmentStatus.pending,
    uploadProgress: 0,
    galleryAssetId: galleryAssetId,
  );
}
