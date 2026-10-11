import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_gallery_grid.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_panel_source_bar.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_download_service.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_native_pickers.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validation_l10n.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/attachments/gallery_attachment_selection.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/features/settings/providers/chat_input_preferences_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AttachmentPanelContent extends ConsumerStatefulWidget {
  const AttachmentPanelContent({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  ConsumerState<AttachmentPanelContent> createState() =>
      _AttachmentPanelContentState();
}

class _AttachmentPanelContentState extends ConsumerState<AttachmentPanelContent>
    with WidgetsBindingObserver {
  static const int _pageSize = 80;

  final List<AttachmentGalleryItem> _items = <AttachmentGalleryItem>[];
  final Map<String, Future<Uint8List?>> _thumbnailFutures =
      <String, Future<Uint8List?>>{};
  AttachmentGalleryAccess _access = AttachmentGalleryAccess.granted;
  bool _loading = true;
  bool _loadingMore = false;
  bool _hasMore = true;
  final Set<String> _resolvingAssetIds = <String>{};
  Future<void> _assetAdds = Future<void>.value();
  int _page = 0;
  int _loadGeneration = 0;
  bool _galleryNeedsRefresh = false;
  Timer? _galleryRefreshDebounce;
  late final AttachmentGallerySource _gallerySource;

  @override
  void initState() {
    super.initState();
    _gallerySource = ref.read(attachmentGallerySourceProvider);
    WidgetsBinding.instance.addObserver(this);
    widget.scrollController.addListener(_onScroll);
    _gallerySource.addChangeListener(_onGalleryChanged);
    unawaited(_bootstrap());
  }

  @override
  void dispose() {
    _galleryRefreshDebounce?.cancel();
    _gallerySource.removeChangeListener(_onGalleryChanged);
    WidgetsBinding.instance.removeObserver(this);
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      return;
    }
    if (_access == AttachmentGalleryAccess.denied) {
      unawaited(_bootstrap());
      return;
    }
    if (!_isGalleryNearTop) {
      _galleryNeedsRefresh = true;
      return;
    }
    unawaited(_loadMore(reset: true));
  }

  bool get _isGalleryNearTop {
    if (!widget.scrollController.hasClients) {
      return _items.isEmpty;
    }
    return widget.scrollController.position.pixels <= 8;
  }

  void _onGalleryChanged() {
    if (_access != AttachmentGalleryAccess.granted) {
      return;
    }
    _galleryRefreshDebounce?.cancel();
    _galleryRefreshDebounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) {
        return;
      }
      if (_isGalleryNearTop) {
        unawaited(_loadMore(reset: true));
        return;
      }
      _galleryNeedsRefresh = true;
    });
  }

  String get _channelId =>
      ref.read(chatViewModelProvider.select((ChatViewState s) => s.channelId));

  int get _attachmentCount =>
      ref.read(cloudUploadControllerProvider(_channelId)).items.length;

  Future<Uint8List?> _loadThumbnail(String id) {
    return _thumbnailFutures.putIfAbsent(
      id,
      () => _gallerySource.loadThumbnail(id, size: 180),
    );
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) {
      return;
    }
    if (_galleryNeedsRefresh && _isGalleryNearTop) {
      if (!_loadingMore && !_loading) {
        unawaited(_loadMore(reset: true));
      }
      return;
    }
    if (!_hasMore || _loadingMore || _loading) {
      return;
    }
    final ScrollPosition position = widget.scrollController.position;
    if (position.pixels > position.maxScrollExtent - 400) {
      unawaited(_loadMore());
    }
  }

  Future<void> _bootstrap() async {
    try {
      final AttachmentGalleryAccess access = await _gallerySource
          .requestAccess();
      if (!mounted) {
        return;
      }
      setState(() => _access = access);
      if (access != AttachmentGalleryAccess.granted) {
        setState(() => _loading = false);
        return;
      }
      await _loadMore(reset: true);
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() => _loading = false);
    }
  }

  Future<void> _loadMore({bool reset = false}) async {
    if (_loadingMore && !reset) {
      return;
    }
    final int generation = ++_loadGeneration;
    setState(() {
      _loadingMore = true;
      if (reset) {
        _galleryNeedsRefresh = false;
        _page = 0;
        _hasMore = true;
        if (_items.isEmpty) {
          _loading = true;
        }
      }
    });
    try {
      final List<AttachmentGalleryItem> next = await _gallerySource.loadPage(
        page: _page,
        pageSize: _pageSize,
      );
      if (!mounted || generation != _loadGeneration) {
        return;
      }
      setState(() {
        if (reset) {
          _items
            ..clear()
            ..addAll(next);
        } else {
          _items.addAll(next);
        }
        _hasMore = next.length >= _pageSize;
        if (next.isNotEmpty) {
          _page += 1;
        }
        _loading = false;
        _loadingMore = false;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && generation == _loadGeneration) {
          _onScroll();
        }
      });
    } on Object {
      if (!mounted || generation != _loadGeneration) {
        return;
      }
      setState(() {
        _loading = false;
        _loadingMore = false;
      });
    }
  }

  Future<void> _addUploads(
    List<ComposerUploadFile> files, {
    String? channelId,
  }) async {
    if (files.isEmpty) {
      return;
    }
    final FileUploadValidationResult result = await ref
        .read(cloudUploadControllerProvider(channelId ?? _channelId).notifier)
        .addFiles(files);
    if (mounted) {
      _toastValidation(result);
    }
  }

  void _toastValidation(FileUploadValidationResult result) {
    if (!mounted) {
      return;
    }
    final String? message = fileUploadValidationMessage(
      FluxerLocalizations.of(context),
      result,
    );
    if (message == null) {
      return;
    }
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(message: message, variant: FluxerToastVariant.warning),
        );
  }

  Future<void> _onAssetPressed(AttachmentGalleryItem item) async {
    if (_resolvingAssetIds.contains(item.id)) {
      return;
    }
    final String channelId = _channelId;
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
      return;
    }
    if (attachments.length + _resolvingAssetIds.length >=
        kMaxAttachmentsPerMessage) {
      _toastValidation(
        const FileUploadValidationResult.failure(
          FileUploadValidationError.tooManyAttachments,
        ),
      );
      return;
    }
    setState(() => _resolvingAssetIds.add(item.id));
    final Future<void> earlierAdds = _assetAdds;
    final Completer<void> added = Completer<void>();
    _assetAdds = added.future;
    try {
      final AttachmentGalleryFile? picked = await _gallerySource.resolveFile(
        item.id,
      );
      await earlierAdds;
      if (!mounted || picked == null) {
        return;
      }
      await _addUploads(<ComposerUploadFile>[
        composerUploadFile(
          picked.file,
          displayFilename: picked.filename,
          galleryAssetId: item.id,
        ),
      ], channelId: channelId);
    } finally {
      added.complete();
      if (mounted) {
        setState(() => _resolvingAssetIds.remove(item.id));
      }
    }
  }

  Future<void> _onCameraPressed() async {
    if (_attachmentCount >= kMaxAttachmentsPerMessage) {
      _toastValidation(
        const FileUploadValidationResult.failure(
          FileUploadValidationError.tooManyAttachments,
        ),
      );
      return;
    }
    final bool allowed = await ensureSystemPermission(
      context,
      SystemPermissionKind.camera,
    );
    if (!allowed || !mounted) {
      return;
    }
    final List<ComposerUploadFile> uploads = await pickNativeCameraUpload();
    final bool savedToGallery =
        uploads.isNotEmpty &&
        ref.read(chatInputPreferencesProvider).saveCameraCapturesToDevice;
    if (savedToGallery) {
      await saveLocalAttachmentToDeviceGallery(uploads.first.file);
    }
    await _addUploads(uploads);
    if (savedToGallery) {
      await _loadMore(reset: true);
    }
  }

  Future<void> _onPhotosPressed() async {
    final int limit = remainingAttachmentPickLimit(_attachmentCount);
    if (limit <= 0) {
      _toastValidation(
        const FileUploadValidationResult.failure(
          FileUploadValidationError.tooManyAttachments,
        ),
      );
      return;
    }
    final String channelId = _channelId;
    final GallerySelectionChange change = await pickNativeGallerySelection(
      attachments: ref.read(cloudUploadControllerProvider(channelId)).items,
    );
    final FileUploadValidationResult result = await ref
        .read(cloudUploadControllerProvider(channelId).notifier)
        .applyGallerySelection(change);
    _toastValidation(result);
  }

  Future<void> _onFilesPressed() async {
    await _addUploads(await pickNativeFileUploads());
  }

  Future<void> _onOpenPhotoSettings() async {
    final bool allowed = await ensureSystemPermission(
      context,
      SystemPermissionKind.photos,
    );
    if (!mounted) {
      return;
    }
    if (allowed) {
      await _bootstrap();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Set<String> selectedIds = <String>{
      ...ref.watch(
        cloudUploadControllerProvider(_channelId).select(
          (CloudComposerAttachments attachments) =>
              selectedGalleryAssetIds(attachments.items),
        ),
      ),
      ..._resolvingAssetIds,
    };
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return ColoredBox(
      color: context.colors.chatInputBackground,
      child: Column(
        children: <Widget>[
          Expanded(child: _body(context, l10n, selectedIds)),
          Padding(
            padding: EdgeInsets.only(
              top: context.layout.s1,
              bottom: context.layout.s2,
            ),
            child: AttachmentPanelSourceBar(
              onPhotosPressed: () => unawaited(_onPhotosPressed()),
              onFilesPressed: () => unawaited(_onFilesPressed()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(
    BuildContext context,
    FluxerLocalizations l10n,
    Set<String> selectedIds,
  ) {
    if (_loading && _items.isEmpty) {
      return const Center(child: FluxerLoadingSpinner());
    }
    if (_access == AttachmentGalleryAccess.denied) {
      return _AttachmentLibraryPermissionState(
        title: l10n.chatAttachmentLibraryPermissionTitle,
        description: l10n.chatAttachmentLibraryPermissionBody,
        settingsLabel: l10n.chatAttachmentLibraryPermissionSettings,
        cameraLabel: l10n.chatAttachmentSourceCamera,
        onOpenSettings: () => unawaited(_onOpenPhotoSettings()),
        onCameraPressed: () => unawaited(_onCameraPressed()),
      );
    }
    return AttachmentGalleryGrid(
      items: _items,
      selectedAssetIds: selectedIds,
      thumbnailLoader: _loadThumbnail,
      onCameraPressed: () => unawaited(_onCameraPressed()),
      onAssetPressed: (AttachmentGalleryItem item) {
        unawaited(_onAssetPressed(item));
      },
      scrollController: widget.scrollController,
      isLoadingMore: _loadingMore && _items.isNotEmpty,
    );
  }
}

class _AttachmentLibraryPermissionState extends StatelessWidget {
  const _AttachmentLibraryPermissionState({
    required this.title,
    required this.description,
    required this.settingsLabel,
    required this.cameraLabel,
    required this.onOpenSettings,
    required this.onCameraPressed,
  });

  final String title;
  final String description;
  final String settingsLabel;
  final String cameraLabel;
  final VoidCallback onOpenSettings;
  final VoidCallback onCameraPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhosphorIcon(
              PhosphorIconsFill.image,
              size: 42,
              color: colors.textTertiary,
            ),
            SizedBox(height: layout.s2),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textStyles.channelName.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: layout.s1),
            Text(
              description,
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textTertiary,
              ),
            ),
            SizedBox(height: layout.s4),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: layout.s2,
              runSpacing: layout.s2,
              children: <Widget>[
                FluxerButton.secondary(
                  label: settingsLabel,
                  fitContent: true,
                  onPressed: onOpenSettings,
                ),
                FluxerButton.secondary(
                  icon: PhosphorIconsFill.camera,
                  label: cameraLabel,
                  fitContent: true,
                  onPressed: onCameraPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
