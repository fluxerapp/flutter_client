import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:photo_manager/photo_manager.dart';

void main() {
  test('HEIC photos go out as a JPEG export', () {
    expect(galleryAssetNeedsExport('IMG_0001.HEIC'), isTrue);
    expect(galleryAssetNeedsExport('IMG_0002.heif'), isTrue);
    expect(galleryAssetNeedsExport('IMG_0568.GIF'), isFalse);
    expect(galleryAssetNeedsExport('IMG_0570.PNG'), isFalse);
    expect(galleryAssetNeedsExport('IMG_0571.MOV'), isFalse);
  });

  test('the upload keeps the library title', () {
    expect(
      galleryUploadFilename(
        title: 'IMG_0568.GIF',
        filePath: '/tmp/38bb_exif.gif',
      ),
      'IMG_0568.GIF',
    );
    expect(
      galleryUploadFilename(
        title: 'IMG_0001.HEIC',
        filePath: '/tmp/55c2_exif.jpg',
      ),
      'IMG_0001.jpg',
    );
    expect(
      galleryUploadFilename(title: '', filePath: '/tmp/86FD638E.mp4'),
      '86FD638E.mp4',
    );
  });

  test('iOS lists the library by date added, newest first', () {
    expect(attachmentGalleryFilterFor(TargetPlatform.iOS).orders, isEmpty);
    expect(
      attachmentGalleryFilterFor(TargetPlatform.android).orders,
      isNotEmpty,
    );
  });

  test('maps photo library permission states to gallery access', () {
    expect(
      attachmentGalleryAccessForState(PermissionState.authorized),
      AttachmentGalleryAccess.granted,
    );
    expect(
      attachmentGalleryAccessForState(PermissionState.limited),
      AttachmentGalleryAccess.limited,
    );
    expect(
      attachmentGalleryAccessForState(PermissionState.denied),
      AttachmentGalleryAccess.denied,
    );
  });

  test('does not re-request when access is already limited', () async {
    var requestCalls = 0;
    final PermissionState state = await resolveAttachmentGalleryPermissionState(
      readPermissionState: ({required PermissionRequestOption requestOption}) {
        return Future<PermissionState>.value(PermissionState.limited);
      },
      requestPermission: ({required PermissionRequestOption requestOption}) {
        requestCalls += 1;
        return Future<PermissionState>.value(PermissionState.limited);
      },
    );

    expect(state, PermissionState.limited);
    expect(requestCalls, 0);
  });

  test('requests permission only while still undetermined', () async {
    var requestCalls = 0;
    final PermissionState state = await resolveAttachmentGalleryPermissionState(
      readPermissionState: ({required PermissionRequestOption requestOption}) {
        return Future<PermissionState>.value(PermissionState.notDetermined);
      },
      requestPermission: ({required PermissionRequestOption requestOption}) {
        requestCalls += 1;
        return Future<PermissionState>.value(PermissionState.limited);
      },
    );

    expect(state, PermissionState.limited);
    expect(requestCalls, 1);
  });
}
