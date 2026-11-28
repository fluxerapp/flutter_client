import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_media_kind.dart';

class MessageMediaMenuTarget {
  const MessageMediaMenuTarget({
    required this.kind,
    required this.url,
    this.downloadUrl,
    this.filename,
    this.attachment,
    this.embedIndex,
    this.contentHash,
    this.isMatureMedia = false,
  });

  final MessageMediaKind kind;
  final String url;
  final String? downloadUrl;
  final String? filename;
  final Attachment? attachment;
  final int? embedIndex;
  final String? contentHash;
  final bool isMatureMedia;

  bool get supportsReverseImageSearch =>
      kind == MessageMediaKind.image ||
      kind == MessageMediaKind.gif ||
      kind == MessageMediaKind.gifv;
}
