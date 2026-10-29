import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/settings/utils/platform_desktop_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

bool showWideLayoutAdvancedSettings(BuildContext context) =>
    isWideLayout(context);

bool showKeyboardShortcutAdvancedSettings(BuildContext context) =>
    isWideLayout(context) || isDesktopOs;
