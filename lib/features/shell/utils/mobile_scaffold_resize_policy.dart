bool mobileChannelScaffoldShouldResizeForKeyboard({
  required bool isChatRoute,
  required bool isExpressionPanelOpen,
}) => !isChatRoute;

bool mobileChannelScaffoldShouldRemoveKeyboardInset({
  required bool isChatRoute,
  required bool isExpressionPanelOpen,
}) => isChatRoute;
