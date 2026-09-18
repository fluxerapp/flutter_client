bool isComposerPanelOpen({
  required bool expressionPanelOpen,
  required bool attachmentPanelOpen,
}) {
  return expressionPanelOpen || attachmentPanelOpen;
}

bool usesInlineAttachmentPanel({
  required bool isNativeMobileOs,
  required bool isMobileLayout,
}) {
  return isNativeMobileOs && isMobileLayout;
}
