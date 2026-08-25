import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

enum AttachmentGalleryAccess { granted, denied }

class AttachmentGalleryItem {
  const AttachmentGalleryItem({
    required this.id,
    required this.isVideo,
    this.duration,
  });

  final String id;
  final bool isVideo;
  final Duration? duration;
}

abstract class AttachmentGallerySource {
  Future<AttachmentGalleryAccess> requestAccess();

  Future<List<AttachmentGalleryItem>> loadPage({
    required int page,
    required int pageSize,
  });

  Future<Uint8List?> loadThumbnail(String id, {required int size});

  Future<XFile?> resolveFile(String id);
}

class PhotoManagerAttachmentGallerySource implements AttachmentGallerySource {
  final Map<String, AssetEntity> _assetsById = <String, AssetEntity>{};

  @override
  Future<AttachmentGalleryAccess> requestAccess() async {
    final PermissionState state = await PhotoManager.requestPermissionExtend();
    if (state.hasAccess) {
      return AttachmentGalleryAccess.granted;
    }
    return AttachmentGalleryAccess.denied;
  }

  Future<AssetPathEntity?> _recentAlbum() async {
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
    );
    if (albums.isEmpty) {
      return null;
    }
    return albums.first;
  }

  void _rememberAssets(List<AssetEntity> assets) {
    for (final AssetEntity asset in assets) {
      _assetsById[asset.id] = asset;
    }
  }

  Future<AssetEntity?> _assetById(String id) async {
    final AssetEntity? cached = _assetsById[id];
    if (cached != null) {
      return cached;
    }
    final AssetEntity? asset = await AssetEntity.fromId(id);
    if (asset != null) {
      _assetsById[id] = asset;
    }
    return asset;
  }

  @override
  Future<List<AttachmentGalleryItem>> loadPage({
    required int page,
    required int pageSize,
  }) async {
    final AssetPathEntity? album = await _recentAlbum();
    if (album == null) {
      return const <AttachmentGalleryItem>[];
    }
    final List<AssetEntity> assets = await album.getAssetListPaged(
      page: page,
      size: pageSize,
    );
    _rememberAssets(assets);
    return assets
        .map(
          (AssetEntity asset) => AttachmentGalleryItem(
            id: asset.id,
            isVideo: asset.type == AssetType.video,
            duration: asset.duration > 0
                ? Duration(seconds: asset.duration)
                : null,
          ),
        )
        .toList(growable: false);
  }

  @override
  Future<Uint8List?> loadThumbnail(String id, {required int size}) async {
    final AssetEntity? asset = await _assetById(id);
    if (asset == null) {
      return null;
    }
    return asset.thumbnailDataWithSize(ThumbnailSize(size, size));
  }

  @override
  Future<XFile?> resolveFile(String id) async {
    final AssetEntity? asset = await _assetById(id);
    if (asset == null) {
      return null;
    }
    final file = await asset.file;
    if (file == null) {
      return null;
    }
    return XFile(file.path, mimeType: asset.mimeType, name: asset.title);
  }
}

final Provider<AttachmentGallerySource> attachmentGallerySourceProvider =
    Provider<AttachmentGallerySource>(
      (Ref ref) => PhotoManagerAttachmentGallerySource(),
    );
