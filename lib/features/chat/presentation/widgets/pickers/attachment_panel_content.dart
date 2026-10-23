import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:fluxer_app/features/chat/domain/cloud_composer_attachments.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_gallery_grid.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_panel_source_bar.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_gallery_controller.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/providers/upload/user_upload_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_native_pickers.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validation_l10n.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/attachments/gallery_attachment_selection.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref
        .read(attachmentGalleryControllerProvider.notifier)
        .attachScrollController(widget.scrollController);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      return;
    }
    ref.read(attachmentGalleryControllerProvider.notifier).onAppResumed();
  }

  void _onScroll() {
    ref.read(attachmentGalleryControllerProvider.notifier).handleScroll();
  }

  String get _channelId =>
      ref.read(chatViewModelProvider.select((ChatViewState s) => s.channelId));

  void _toastValidation(FileUploadValidationResult result) {
    if (!context.mounted) {
      return;
    }
    final FileUploadValidationCopy? copy = fileUploadValidationCopy(
      FluxerLocalizations.of(context),
      result,
      maxAttachments: kMaxAttachmentsPerMessage,
      maxFileBytes: ref.read(maxAttachmentFileBytesProvider),
    );
    if (copy == null) {
      return;
    }
    unawaited(showErrorDialog(context, title: copy.title, body: copy.body));
  }

  Future<void> _onCameraPressed() async {
    final bool allowed = await ensureSystemPermission(
      context,
      SystemPermissionKind.camera,
    );
    if (!allowed || !context.mounted) {
      return;
    }
    final int attachmentCount = ref
        .read(cloudUploadControllerProvider(_channelId))
        .items
        .length;
    final FileUploadValidationResult? result = await ref
        .read(attachmentGalleryControllerProvider.notifier)
        .captureFromCamera(
          channelId: _channelId,
          attachmentCount: attachmentCount,
        );
    if (result != null && context.mounted) {
      _toastValidation(result);
    }
  }

  Future<void> _onPhotosPressed() async {
    final int attachmentCount = ref
        .read(cloudUploadControllerProvider(_channelId))
        .items
        .length;
    final FileUploadValidationResult? result = await ref
        .read(attachmentGalleryControllerProvider.notifier)
        .pickMoreFromNativeGallery(
          channelId: _channelId,
          attachmentCount: attachmentCount,
        );
    if (result != null && context.mounted) {
      _toastValidation(result);
    }
  }

  Future<void> _onFilesPressed() async {
    final FileUploadValidationResult? result = await ref
        .read(attachmentGalleryControllerProvider.notifier)
        .addUploads(
          channelId: _channelId,
          files: await pickNativeFileUploads(),
        );
    if (result != null && context.mounted) {
      _toastValidation(result);
    }
  }

  Future<void> _onOpenPhotoSettings() async {
    final bool allowed = await ensureSystemPermission(
      context,
      SystemPermissionKind.photos,
    );
    if (!context.mounted) {
      return;
    }
    if (allowed) {
      await ref
          .read(attachmentGalleryControllerProvider.notifier)
          .reloadAfterPhotoAccessGranted();
    }
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return ColoredBox(
      color: context.colors.backgroundSecondaryAlt,
      child: Column(
        children: <Widget>[
          const _AttachmentLimitedLibraryBannerHost(),
          Expanded(
            child: _AttachmentGalleryBodyHost(
              scrollController: widget.scrollController,
              onCameraPressed: () => unawaited(_onCameraPressed()),
              onOpenPhotoSettings: () => unawaited(_onOpenPhotoSettings()),
              onAssetPressed: (AttachmentGalleryItem item) {
                unawaited(_onAssetPressed(item));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: layout.s1, bottom: layout.s2),
            child: AttachmentPanelSourceBar(
              onPhotosPressed: () => unawaited(_onPhotosPressed()),
              onFilesPressed: () => unawaited(_onFilesPressed()),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onAssetPressed(AttachmentGalleryItem item) async {
    final FileUploadValidationResult? result = await ref
        .read(attachmentGalleryControllerProvider.notifier)
        .toggleGalleryAsset(channelId: _channelId, item: item);
    if (result != null && context.mounted) {
      _toastValidation(result);
    }
  }
}

class _AttachmentLimitedLibraryBannerHost extends ConsumerWidget {
  const _AttachmentLimitedLibraryBannerHost();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AttachmentGalleryAccess access = ref.watch(
      attachmentGalleryControllerProvider.select(
        (AttachmentGalleryState state) => state.access,
      ),
    );
    if (access != AttachmentGalleryAccess.limited) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(layout.s3, layout.s1, layout.s2, 0),
          child: _AttachmentLimitedLibraryBanner(
            message: l10n.chatAttachmentLibraryLimitedBody,
            manageLabel: l10n.chatAttachmentLibraryLimitedManage,
            onManagePressed: () {
              unawaited(
                ref
                    .read(attachmentGalleryControllerProvider.notifier)
                    .manageLimitedLibrary(),
              );
            },
          ),
        ),
        SizedBox(height: layout.s2),
      ],
    );
  }
}

class _AttachmentGalleryBodyHost extends ConsumerWidget {
  const _AttachmentGalleryBodyHost({
    required this.scrollController,
    required this.onCameraPressed,
    required this.onOpenPhotoSettings,
    required this.onAssetPressed,
  });

  final ScrollController scrollController;
  final VoidCallback onCameraPressed;
  final VoidCallback onOpenPhotoSettings;
  final ValueChanged<AttachmentGalleryItem> onAssetPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ({
      AttachmentGalleryAccess access,
      List<AttachmentGalleryItem> items,
      bool loading,
      bool loadingMore,
      Set<String> resolvingAssetIds,
    })
    gallery = ref.watch(
      attachmentGalleryControllerProvider.select(
        (AttachmentGalleryState state) => (
          access: state.access,
          items: state.items,
          loading: state.loading,
          loadingMore: state.loadingMore,
          resolvingAssetIds: state.resolvingAssetIds,
        ),
      ),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String channelId = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.channelId),
    );
    final Set<String> selectedIds = <String>{
      ...ref.watch(
        cloudUploadControllerProvider(channelId).select(
          (CloudComposerAttachments attachments) =>
              selectedGalleryAssetIds(attachments.items),
        ),
      ),
      ...gallery.resolvingAssetIds,
    };
    final AttachmentGalleryController galleryController = ref.read(
      attachmentGalleryControllerProvider.notifier,
    );

    if (gallery.loading && gallery.items.isEmpty) {
      return const Center(child: FluxerLoadingSpinner());
    }
    if (gallery.access == AttachmentGalleryAccess.denied) {
      return _AttachmentLibraryPermissionState(
        title: l10n.chatAttachmentLibraryPermissionTitle,
        description: l10n.chatAttachmentLibraryPermissionBody,
        settingsLabel: l10n.chatAttachmentLibraryPermissionSettings,
        cameraLabel: l10n.chatAttachmentSourceCamera,
        onOpenSettings: onOpenPhotoSettings,
        onCameraPressed: onCameraPressed,
      );
    }
    return AttachmentGalleryGrid(
      items: gallery.items,
      selectedAssetIds: selectedIds,
      thumbnailLoader: galleryController.loadThumbnail,
      onCameraPressed: onCameraPressed,
      onAssetPressed: onAssetPressed,
      scrollController: scrollController,
      isLoadingMore: gallery.loadingMore && gallery.items.isNotEmpty,
    );
  }
}

class _AttachmentLimitedLibraryBanner extends StatelessWidget {
  const _AttachmentLimitedLibraryBanner({
    required this.message,
    required this.manageLabel,
    required this.onManagePressed,
  });

  final String message;
  final String manageLabel;
  final VoidCallback onManagePressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            message,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ),
        SizedBox(width: layout.s2),
        FluxerButton.secondary(
          label: manageLabel,
          size: FluxerButtonSize.compact,
          fitContent: true,
          onPressed: onManagePressed,
        ),
      ],
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
