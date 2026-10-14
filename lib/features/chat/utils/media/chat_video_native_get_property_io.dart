import 'package:media_kit/media_kit.dart';

Future<String> getNativePlayerProperty(NativePlayer player, String key) {
  return player.getProperty(key, waitForInitialization: false);
}
