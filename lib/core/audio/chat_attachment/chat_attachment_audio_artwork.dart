import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

const String _kChatAttachmentAudioArtAsset = 'assets/images/app_icon.png';
const String _kChatAttachmentAudioArtFileName =
    'chat_attachment_audio_artwork.png';

Uri? _chatAttachmentAudioArtUri;

Uri? get chatAttachmentAudioArtUri => _chatAttachmentAudioArtUri;

Future<void> bootstrapChatAttachmentAudioArtwork() async {
  if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
    return;
  }
  final ByteData data = await rootBundle.load(_kChatAttachmentAudioArtAsset);
  final Directory directory = await getTemporaryDirectory();
  final File file = File('${directory.path}/$_kChatAttachmentAudioArtFileName');
  await file.writeAsBytes(
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
  );
  _chatAttachmentAudioArtUri = Uri.file(file.path);
}
