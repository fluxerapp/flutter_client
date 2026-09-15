import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/utils/messages/double_tap_reaction.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showDoubleTapReactionPicker(
  BuildContext context,
  WidgetRef ref, {
  String? channelId,
}) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerEmojiPickerSheet.show(
    context,
    title: l10n.doubleTapReactionEditTitle,
    subtitle: Text(
      l10n.doubleTapReactionEditSubtitle,
      style: context.textStyles.bodySmall.copyWith(
        color: context.colors.textSecondary,
      ),
    ),
    channelId: channelId,
    visibleTabs: const [ExpressionPickerTab.emojis],
    trackEmojiUsageOnSelect: false,
    onEmojiSelected: (emoji) {
      unawaited(saveSelectedDoubleTapReaction(ref, emoji));
    },
  );
}
