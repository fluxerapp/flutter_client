import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';

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
}
