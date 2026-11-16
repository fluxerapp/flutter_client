import 'package:fluxer_clipboard/src/messages.g.dart';

export 'package:fluxer_clipboard/src/messages.g.dart' show NativeClipboardItem;

abstract final class FluxerClipboard {
  static final ClipboardHostApi _api = ClipboardHostApi();

  static Future<List<NativeClipboardItem>> readItems({
    required List<String> mimeTypes,
    required int maxItems,
  }) {
    return _api.readItems(mimeTypes, maxItems);
  }

  static Future<String?> readText() => _api.readText();
}
