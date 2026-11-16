import 'package:fluxer_clipboard/src/messages.g.dart';

export 'package:fluxer_clipboard/src/messages.g.dart' show NativeClipboardItem;

final ClipboardHostApi _api = ClipboardHostApi();

Future<List<NativeClipboardItem>> readNativeClipboardItems({
  required List<String> mimeTypes,
  required int maxItems,
}) {
  return _api.readItems(mimeTypes, maxItems);
}

Future<String?> readNativeClipboardText() => _api.readText();
