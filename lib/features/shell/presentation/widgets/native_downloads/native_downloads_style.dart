import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

const Object kNativeTitlebarTapGroup = ValueKey<String>('native-titlebar');
const Duration kNativeDownloadsHoverDuration = Duration(milliseconds: 120);

const double _kTextHeight = 1.5;

TextStyle nativeDownloadsTitleStyle(BuildContext context) =>
    context.textStyles.bodySmall.copyWith(
      color: context.colors.textPrimary,
      letterSpacing: 0,
      height: _kTextHeight,
      leadingDistribution: TextLeadingDistribution.even,
    );

TextStyle nativeDownloadsMetaStyle(BuildContext context) =>
    context.textStyles.timestamp.copyWith(
      color: context.colors.textTertiary,
      letterSpacing: 0,
      height: _kTextHeight,
      leadingDistribution: TextLeadingDistribution.even,
    );
