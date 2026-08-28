import 'dart:async';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
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

  void addChangeListener(VoidCallback listener) {}

  void removeChangeListener(VoidCallback listener) {}
}

class PhotoManagerAttachmentGallerySource implements AttachmentGallerySource {
  static final FilterOptionGroup _galleryFilter = FilterOptionGroup(
    orders: const <OrderOption>[OrderOption()],
  );

  final Map<String, AssetEntity> _assetsById = <String, AssetEntity>{};
  final List<VoidCallback> _changeListeners = <VoidCallback>[];
  bool _changeNotifyStarted = false;

  void _onGalleryChange(MethodCall call) {
    for (final VoidCallback listener in _changeListeners.toList()) {
      listener();
    }
  }

  @override
  void addChangeListener(VoidCallback listener) {
    if (_changeListeners.isEmpty) {
      PhotoManager.addChangeCallback(_onGalleryChange);
      unawaited(PhotoManager.startChangeNotify());
      _changeNotifyStarted = true;
    }
    _changeListeners.add(listener);
  }

  @override
  void removeChangeListener(VoidCallback listener) {
    _changeListeners.remove(listener);
    if (_changeListeners.isEmpty && _changeNotifyStarted) {
      PhotoManager.removeChangeCallback(_onGalleryChange);
      unawaited(PhotoManager.stopChangeNotify());
      _changeNotifyStarted = false;
    }
  }

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
      filterOption: _galleryFilter,
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
    AssetPathEntity? album = await _recentAlbum();
    if (album == null) {
      return const <AttachmentGalleryItem>[];
    }
    if (page == 0) {
      _assetsById.clear();
      album = await album.obtainForNewProperties();
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
