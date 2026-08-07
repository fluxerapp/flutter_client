import 'package:unifiedpush_platform_interface/unifiedpush_platform_interface.dart';

class UnifiedPushLinux extends DefaultUnifiedPush {
  static void registerWith() {
    UnifiedPushPlatform.instance = UnifiedPushLinux();
  }
}
