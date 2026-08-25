import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

final class UserSettingsSectionScrollKeys {
  UserSettingsSectionScrollKeys._();

  static final Map<String, GlobalKey> _keys = <String, GlobalKey>{};

  static const int _defaultMaxScrollAttempts = 20;

  static GlobalKey keyFor(String sectionId) {
    return _keys.putIfAbsent(sectionId, GlobalKey.new);
  }

  static void scheduleScrollToField(BuildContext context, String fieldId) {
    unawaited(scrollToFieldWithRetry(context, fieldId));
  }

  static Future<void> scrollToFieldWithRetry(
    BuildContext context,
    String fieldId, {
    int maxAttempts = _defaultMaxScrollAttempts,
  }) async {
    for (var attempt = 0; attempt < maxAttempts; attempt++) {
      if (!context.mounted) {
        return;
      }
      final GlobalKey? key = _keys[fieldId];
      final BuildContext? targetContext = key?.currentContext;
      if (targetContext != null && targetContext.mounted) {
        await scrollToField(context, fieldId);
        return;
      }
      await WidgetsBinding.instance.endOfFrame;
    }
  }

  static Future<void> scrollToField(
    BuildContext context,
    String fieldId, {
    Duration? duration,
    Curve? curve,
  }) async {
    final GlobalKey? key = _keys[fieldId];
    if (key == null) {
      return;
    }
    final BuildContext? targetContext = key.currentContext;
    if (targetContext == null || !targetContext.mounted) {
      return;
    }
    final motion = context.motion;
    await Scrollable.ensureVisible(
      targetContext,
      alignment: 0.1,
      duration: duration ?? motion.normal,
      curve: curve ?? motion.curve,
    );
  }
}
