import 'dart:async';
import 'dart:typed_data';

import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_download_service.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_native_pickers.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/attachments/gallery_attachment_selection.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/features/settings/providers/chat_input_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attachment_gallery_controller.g.dart';

class AttachmentGalleryState {
  const AttachmentGalleryState({
    this.access = AttachmentGalleryAccess.granted,
    this.items = const <AttachmentGalleryItem>[],
    this.loading = true,
    this.loadingMore = false,
    this.hasMore = true,
    this.resolvingAssetIds = const <String>{},
  });

  final AttachmentGalleryAccess access;
  final List<AttachmentGalleryItem> items;
  final bool loading;
  final bool loadingMore;
  final bool hasMore;
  final Set<String> resolvingAssetIds;

  AttachmentGalleryState copyWith({
    AttachmentGalleryAccess? access,
    List<AttachmentGalleryItem>? items,
    bool? loading,
    bool? loadingMore,
    bool? hasMore,
    Set<String>? resolvingAssetIds,
  }) {
    return AttachmentGalleryState(
      access: access ?? this.access,
      items: items ?? this.items,
      loading: loading ?? this.loading,
      loadingMore: loadingMore ?? this.loadingMore,
      hasMore: hasMore ?? this.hasMore,
      resolvingAssetIds: resolvingAssetIds ?? this.resolvingAssetIds,
    );
  }
}

@Riverpod()
class AttachmentGalleryController extends _$AttachmentGalleryController {
  static const int _pageSize = 80;

  late AttachmentGallerySource _gallerySource;
  final Map<String, Future<Uint8List?>> _thumbnailFutures =
      <String, Future<Uint8List?>>{};
  ScrollController? _scrollController;
  int _page = 0;
  int _loadGeneration = 0;
  bool _galleryNeedsRefresh = false;
  Timer? _galleryRefreshDebounce;
  Future<void> _assetAdds = Future<void>.value();
  VoidCallback? _galleryChangeListener;
  AttachmentGallerySource? _listeningSource;

  @override
  AttachmentGalleryState build() {
    ref.onDispose(_dispose);
    _attachGallerySource(ref.read(attachmentGallerySourceProvider));
    return const AttachmentGalleryState();
  }

  void attachScrollController(ScrollController scrollController) {
    _scrollController = scrollController;
  }

  void _attachGallerySource(AttachmentGallerySource source) {
    if (_listeningSource == source) {
      return;
    }
    _disposeGalleryListener();
    _gallerySource = source;
    _listeningSource = source;
    _galleryChangeListener = _onGalleryChanged;
    source.addChangeListener(_galleryChangeListener!);
    unawaited(_bootstrap());
  }

  void _dispose() {
    _galleryRefreshDebounce?.cancel();
    _disposeGalleryListener();
  }

  void _disposeGalleryListener() {
    if (_galleryChangeListener == null || _listeningSource == null) {
      return;
    }
    _listeningSource!.removeChangeListener(_galleryChangeListener!);
    _galleryChangeListener = null;
    _listeningSource = null;
  }

  bool isGalleryNearTop() {
    final ScrollController? scrollController = _scrollController;
    if (scrollController == null || !scrollController.hasClients) {
      return state.items.isEmpty;
    }
    return scrollController.position.pixels <= 8;
  }

  void handleScroll() {
    final ScrollController? scrollController = _scrollController;
    if (scrollController == null || !scrollController.hasClients) {
      return;
    }
    if (_galleryNeedsRefresh && isGalleryNearTop()) {
      if (!state.loadingMore && !state.loading) {
        unawaited(_loadMore(reset: true));
      }
      return;
    }
    if (!state.hasMore || state.loadingMore || state.loading) {
      return;
    }
    final ScrollPosition position = scrollController.position;
    if (position.pixels > position.maxScrollExtent - 400) {
      unawaited(_loadMore());
    }
  }

  void onAppResumed() {
    if (state.access == AttachmentGalleryAccess.denied) {
      unawaited(_bootstrap());
      return;
    }
    if (!isGalleryNearTop()) {
      _galleryNeedsRefresh = true;
      return;
    }
    unawaited(_loadMore(reset: true));
  }

  Future<Uint8List?> loadThumbnail(String id) {
    return _thumbnailFutures.putIfAbsent(
      id,
      () => _gallerySource.loadThumbnail(id, size: 180),
    );
  }

  Future<void> _bootstrap() async {
    try {
      final AttachmentGalleryAccess access = await _gallerySource
          .requestAccess();
      if (!ref.mounted) {
        return;
      }
      if (!access.canBrowseGallery) {
        state = state.copyWith(access: access, loading: false);
        return;
      }
      state = state.copyWith(access: access);
      await _loadMore(reset: true);
    } on Object {
      if (!ref.mounted) {
        return;
      }
      state = state.copyWith(loading: false);
    }
  }

  Future<void> _loadMore({bool reset = false}) async {
    if (state.loadingMore && !reset) {
      return;
    }
    final int generation = ++_loadGeneration;
    if (reset) {
      _galleryNeedsRefresh = false;
      _page = 0;
      _thumbnailFutures.clear();
    }
    state = state.copyWith(
      loadingMore: true,
      hasMore: reset || state.hasMore,
      loading: state.loading || (reset && state.items.isEmpty),
    );
    try {
      final List<AttachmentGalleryItem> next = await _gallerySource.loadPage(
        page: _page,
        pageSize: _pageSize,
      );
      if (!ref.mounted || generation != _loadGeneration) {
        return;
      }
      final List<AttachmentGalleryItem> items = reset
          ? List<AttachmentGalleryItem>.of(next)
          : <AttachmentGalleryItem>[...state.items, ...next];
      if (next.isNotEmpty) {
        _page += 1;
      }
      state = state.copyWith(
        items: items,
        hasMore: next.length >= _pageSize,
        loading: false,
        loadingMore: false,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ref.mounted && generation == _loadGeneration) {
          handleScroll();
        }
      });
    } on Object {
      if (!ref.mounted || generation != _loadGeneration) {
        return;
      }
      state = state.copyWith(loading: false, loadingMore: false);
    }
  }

  void _onGalleryChanged() {
    if (!state.access.canBrowseGallery) {
      return;
    }
    _galleryRefreshDebounce?.cancel();
    _galleryRefreshDebounce = Timer(const Duration(milliseconds: 300), () {
      if (!ref.mounted) {
        return;
      }
      if (isGalleryNearTop()) {
        unawaited(_loadMore(reset: true));
        return;
      }
      _galleryNeedsRefresh = true;
    });
  }

  Future<FileUploadValidationResult?> toggleGalleryAsset({
    required String channelId,
    required AttachmentGalleryItem item,
  }) async {
    if (state.resolvingAssetIds.contains(item.id)) {
      return null;
    }
    final CloudUploadController uploads = ref.read(
      cloudUploadControllerProvider(channelId).notifier,
    );
    final List<PendingAttachment> attachments = ref
        .read(cloudUploadControllerProvider(channelId))
        .items;
    final PendingAttachment? existing = pendingAttachmentForGalleryAsset(
      attachments: attachments,
      galleryAssetId: item.id,
    );
    if (existing != null) {
      await uploads.removeAttachment(existing.id);
      return null;
    }
    if (attachments.length + state.resolvingAssetIds.length >=
        kMaxAttachmentsPerMessage) {
      return const FileUploadValidationResult.failure(
        FileUploadValidationError.tooManyAttachments,
      );
    }
    state = state.copyWith(
      resolvingAssetIds: <String>{...state.resolvingAssetIds, item.id},
    );
    final Future<void> earlierAdds = _assetAdds;
    final Completer<void> added = Completer<void>();
    _assetAdds = added.future;
    FileUploadValidationResult? validation;
    try {
      final AttachmentGalleryFile? picked = await _gallerySource.resolveFile(
        item.id,
      );
      await earlierAdds;
      if (!ref.mounted || picked == null) {
        return null;
      }
      validation = await ref
          .read(cloudUploadControllerProvider(channelId).notifier)
          .addFiles(<ComposerUploadFile>[
            composerUploadFile(
              picked.file,
              displayFilename: picked.filename,
              galleryAssetId: item.id,
            ),
          ]);
    } finally {
      added.complete();
      if (ref.mounted) {
        state = state.copyWith(
          resolvingAssetIds: Set<String>.of(state.resolvingAssetIds)
            ..remove(item.id),
        );
      }
    }
    return validation;
  }

  Future<FileUploadValidationResult?> addUploads({
    required String channelId,
    required List<ComposerUploadFile> files,
  }) async {
    if (files.isEmpty) {
      return null;
    }
    return ref
        .read(cloudUploadControllerProvider(channelId).notifier)
        .addFiles(files);
  }

  Future<FileUploadValidationResult?> captureFromCamera({
    required String channelId,
    required int attachmentCount,
  }) async {
    if (attachmentCount >= kMaxAttachmentsPerMessage) {
      return const FileUploadValidationResult.failure(
        FileUploadValidationError.tooManyAttachments,
      );
    }
    final List<ComposerUploadFile> uploads = await pickNativeCameraUpload();
    final bool savedToGallery =
        uploads.isNotEmpty &&
        ref.read(chatInputPreferencesProvider).saveCameraCapturesToDevice;
    if (savedToGallery) {
      await saveLocalAttachmentToDeviceGallery(uploads.first.file);
    }
    final FileUploadValidationResult? result = await addUploads(
      channelId: channelId,
      files: uploads,
    );
    if (savedToGallery) {
      await _loadMore(reset: true);
    }
    return result;
  }

  Future<FileUploadValidationResult?> pickMoreFromNativeGallery({
    required String channelId,
    required int attachmentCount,
  }) async {
    final int limit = remainingAttachmentPickLimit(attachmentCount);
    if (limit <= 0) {
      return const FileUploadValidationResult.failure(
        FileUploadValidationError.tooManyAttachments,
      );
    }
    final GallerySelectionChange change = await pickNativeGallerySelection(
      attachments: ref.read(cloudUploadControllerProvider(channelId)).items,
    );
    return ref
        .read(cloudUploadControllerProvider(channelId).notifier)
        .applyGallerySelection(change);
  }

  Future<void> manageLimitedLibrary() async {
    await _gallerySource.manageLimitedLibraryAccess();
    if (!ref.mounted) {
      return;
    }
    final AttachmentGalleryAccess access = await _gallerySource.requestAccess();
    if (!ref.mounted) {
      return;
    }
    if (!access.canBrowseGallery) {
      state = state.copyWith(access: access, loading: false);
      return;
    }
    state = state.copyWith(access: access);
    await _loadMore(reset: true);
  }

  Future<void> reloadAfterPhotoAccessGranted() async {
    await _bootstrap();
  }
}
