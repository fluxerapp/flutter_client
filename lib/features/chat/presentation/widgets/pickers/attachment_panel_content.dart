import 'dart:async';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
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
import 'package:fluxer_app/features/chat/utils/attachment_native_pickers.dart';
import 'package:fluxer_app/features/chat/utils/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validation_l10n.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/gallery_attachment_selection.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
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
  bool _isResolvingAsset = false;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.scrollController.addListener(_onScroll);
    unawaited(_bootstrap());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        _access == AttachmentGalleryAccess.denied) {
      unawaited(_bootstrap());
    }
  }

  AttachmentGallerySource get _source =>
      ref.read(attachmentGallerySourceProvider);

  String get _channelId =>
      ref.read(chatViewModelProvider.select((ChatViewState s) => s.channelId));

  int get _attachmentCount =>
      ref.read(cloudUploadControllerProvider(_channelId)).items.length;

  Future<Uint8List?> _loadThumbnail(String id) {
    return _thumbnailFutures.putIfAbsent(
      id,
      () => _source.loadThumbnail(id, size: 180),
    );
  }

  void _onScroll() {
    if (!_hasMore || _loadingMore || _loading) {
      return;
    }
    if (!widget.scrollController.hasClients) {
      return;
    }
    final ScrollPosition position = widget.scrollController.position;
    if (position.pixels > position.maxScrollExtent - 400) {
      unawaited(_loadMore());
    }
  }

  Future<void> _bootstrap() async {
    try {
      final AttachmentGalleryAccess access = await _source.requestAccess();
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
    if (_loadingMore) {
      return;
    }
    setState(() {
      _loadingMore = true;
      if (reset) {
        _loading = true;
        _page = 0;
        _items.clear();
        _thumbnailFutures.clear();
        _hasMore = true;
      }
    });
    try {
      final List<AttachmentGalleryItem> next = await _source.loadPage(
        page: _page,
        pageSize: _pageSize,
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _items.addAll(next);
        _hasMore = next.length >= _pageSize;
        if (next.isNotEmpty) {
          _page += 1;
        }
        _loading = false;
        _loadingMore = false;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _onScroll();
        }
      });
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() {
        _loading = false;
        _loadingMore = false;
      });
    }
  }

  Future<void> _addUploads(List<ComposerUploadFile> files) async {
    if (files.isEmpty) {
      return;
    }
    final FileUploadValidationResult result = await ref
        .read(cloudUploadControllerProvider(_channelId).notifier)
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
    if (_isResolvingAsset) {
      return;
    }
    final List<PendingAttachment> attachments = ref
        .read(cloudUploadControllerProvider(_channelId))
        .items;
    final PendingAttachment? existing = pendingAttachmentForGalleryAsset(
      attachments: attachments,
      galleryAssetId: item.id,
    );
    if (existing != null) {
      await ref
          .read(cloudUploadControllerProvider(_channelId).notifier)
          .removeAttachment(existing.id);
      return;
    }
    if (attachments.length >= kMaxAttachmentsPerMessage) {
      _toastValidation(
        const FileUploadValidationResult.failure(
          FileUploadValidationError.tooManyAttachments,
        ),
      );
      return;
    }
    _isResolvingAsset = true;
    try {
      final XFile? file = await _source.resolveFile(item.id);
      if (!mounted) {
        return;
      }
      if (file == null) {
        return;
      }
      if (ref.read(cloudUploadControllerProvider(_channelId)).items.length >=
          kMaxAttachmentsPerMessage) {
        _toastValidation(
          const FileUploadValidationResult.failure(
            FileUploadValidationError.tooManyAttachments,
          ),
        );
        return;
      }
      await _addUploads(<ComposerUploadFile>[
        composerUploadFile(file, galleryAssetId: item.id),
      ]);
    } finally {
      _isResolvingAsset = false;
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
    await _addUploads(await pickNativeCameraUpload());
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
    await _addUploads(await pickNativeGalleryUploads(limit: limit));
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
    final Set<String> selectedIds = ref.watch(
      cloudUploadControllerProvider(_channelId).select(
        (CloudComposerAttachments attachments) =>
            selectedGalleryAssetIds(attachments.items),
      ),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return ColoredBox(
      color: context.colors.chatInputBackground,
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: _body(context, l10n, selectedIds)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: context.layout.s2),
              child: AttachmentPanelSourceBar(
                onPhotosPressed: () => unawaited(_onPhotosPressed()),
                onFilesPressed: () => unawaited(_onFilesPressed()),
              ),
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
        onOpenSettings: () => unawaited(_onOpenPhotoSettings()),
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
    required this.onOpenSettings,
  });

  final String title;
  final String description;
  final String settingsLabel;
  final VoidCallback onOpenSettings;

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
            FluxerButton.secondary(
              label: settingsLabel,
              onPressed: onOpenSettings,
            ),
          ],
        ),
      ),
    );
  }
}
