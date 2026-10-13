import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

bool composerHasSendableContent(
  WidgetRef ref,
  String channelId,
  String wireText,
) {
  final bool hasPendingUploads = ref
      .read(cloudUploadControllerProvider(channelId))
      .items
      .isNotEmpty;
  return composerHasSendableContentFromParts(
    channelId: channelId,
    wireText: wireText,
    hasPendingUploads: hasPendingUploads,
  );
}

bool composerHasSendableContentFromParts({
  required String channelId,
  required String wireText,
  required bool hasPendingUploads,
}) {
  if (channelId.isEmpty) {
    return false;
  }
  return hasVisibleContent(wireText) || hasPendingUploads;
}
