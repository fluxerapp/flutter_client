import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';

List<ExpressionPickerTab> expressionPanelVisibleTabs(
  ChannelMessagePermissions perms, {
  bool gifEnabled = true,
}) {
  return <ExpressionPickerTab>[
    if (perms.canShowEmbedControls && gifEnabled) ExpressionPickerTab.gifs,
    if (perms.canShowAttachControls) ExpressionPickerTab.memes,
    ExpressionPickerTab.stickers,
    ExpressionPickerTab.emojis,
  ];
}

List<ExpressionPickerTab> composerInputButtonVisibleTabs({
  required ChannelMessagePermissions perms,
  required AdvancedPreferencesState advanced,
  bool gifEnabled = true,
}) {
  return <ExpressionPickerTab>[
    if (perms.canShowEmbedControls && advanced.showGifButton && gifEnabled)
      ExpressionPickerTab.gifs,
    if (perms.canShowAttachControls && advanced.showMemesButton)
      ExpressionPickerTab.memes,
    if (advanced.showStickersButton) ExpressionPickerTab.stickers,
    if (advanced.showEmojiButton) ExpressionPickerTab.emojis,
  ];
}

ExpressionPickerTab resolveVisibleExpressionTab(
  ExpressionPickerTab selected,
  List<ExpressionPickerTab> visibleTabs,
) {
  if (visibleTabs.isEmpty) {
    return ExpressionPickerTab.emojis;
  }
  if (visibleTabs.contains(selected)) {
    return selected;
  }
  return visibleTabs.first;
}
