import 'package:fluxer_app/material_ui.dart';

class VoiceGridTileKeys {
  final Map<String, GlobalKey> _keys = <String, GlobalKey>{};

  Key of(String tileId) => _keys.putIfAbsent(tileId, GlobalKey.new);

  void release(String tileId) => _keys.remove(tileId);
}
