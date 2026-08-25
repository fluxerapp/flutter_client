import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:gal/gal.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

final Dio _attachmentDownloadDio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(minutes: 2),
    followRedirects: true,
  ),
);

Future<void> downloadChatAttachmentMedia({
  required BuildContext context,
  required WidgetRef ref,
  required String url,
  String? filename,
}) async {
  final String trimmedUrl = url.trim();
  if (trimmedUrl.isEmpty || !context.mounted) {
    return;
  }
  if (isFluxerNativeMobileOs) {
    await _downloadToGallery(
      context: context,
      ref: ref,
      url: trimmedUrl,
      filename: filename,
    );
    return;
  }
  if (isFluxerDesktopOs) {
    await _downloadToFilePicker(
      context: context,
      ref: ref,
      url: trimmedUrl,
      filename: filename,
    );
    return;
  }
  await handleExternalLinkTap(context, trimmedUrl);
}

Future<void> _downloadToGallery({
  required BuildContext context,
  required WidgetRef ref,
  required String url,
  String? filename,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  try {
    if (!await Gal.hasAccess()) {
      await Gal.requestAccess();
      if (!await Gal.hasAccess()) {
        _showFailureToast(ref, l10n.chatAttachmentDownloadFailedToast);
        return;
      }
    }
    final String resolvedFilename = resolveAttachmentDownloadFilename(
      url: url,
      filename: filename,
    );
    final Directory tempDir = await getTemporaryDirectory();
    final String filePath = p.join(tempDir.path, resolvedFilename);
    await _attachmentDownloadDio.download(url, filePath);
    if (isVideoAttachment(filename: resolvedFilename)) {
      await Gal.putVideo(filePath);
    } else {
      await Gal.putImage(filePath);
    }
    _showSuccessToast(ref, l10n.chatAttachmentDownloadedToast);
  } on GalException {
    _showFailureToast(ref, l10n.chatAttachmentDownloadFailedToast);
  } on Object {
    _showFailureToast(ref, l10n.chatAttachmentDownloadFailedToast);
  }
}

Future<void> _downloadToFilePicker({
  required BuildContext context,
  required WidgetRef ref,
  required String url,
  String? filename,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  try {
    final String resolvedFilename = resolveAttachmentDownloadFilename(
      url: url,
      filename: filename,
    );
    final Response<List<int>> response = await _attachmentDownloadDio
        .get<List<int>>(
          url,
          options: Options(responseType: ResponseType.bytes),
        );
    final List<int>? bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      _showFailureToast(ref, l10n.chatAttachmentDownloadFailedToast);
      return;
    }
    final Uri? path = await FilePicker.saveFile(
      dialogTitle: l10n.chatAttachmentDownload,
      fileName: resolvedFilename,
      bytes: Uint8List.fromList(bytes),
    );
    if (path != null) {
      _showSuccessToast(ref, l10n.chatAttachmentDownloadedToast);
    }
  } on Object {
    _showFailureToast(ref, l10n.chatAttachmentDownloadFailedToast);
  }
}

String resolveAttachmentDownloadFilename({
  required String url,
  String? filename,
}) {
  final String trimmedFilename = filename?.trim() ?? '';
  if (trimmedFilename.isNotEmpty) {
    return trimmedFilename;
  }
  final Uri? uri = Uri.tryParse(url);
  if (uri != null) {
    final String fromPath = uri.pathSegments.isNotEmpty
        ? uri.pathSegments.last
        : '';
    if (fromPath.isNotEmpty && fromPath.contains('.')) {
      return fromPath;
    }
  }
  return 'attachment';
}

void _showSuccessToast(WidgetRef ref, String message) {
  ref
      .read(toastProvider.notifier)
      .show(FluxerToast(message: message, variant: FluxerToastVariant.success));
}

void _showFailureToast(WidgetRef ref, String message) {
  ref
      .read(toastProvider.notifier)
      .show(FluxerToast(message: message, variant: FluxerToastVariant.danger));
}
